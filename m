Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C730F6C42F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:20:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhJH34KrHz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 17:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Li2Ie8D9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Li2Ie8D9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhJG61Y4Hz303h
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 17:19:09 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M5514o016723;
	Wed, 22 Mar 2023 06:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qRj3tWY+jcK4H/vU4gCmxT+XtraucXzb/lI7io+yqPQ=;
 b=Li2Ie8D9Pk3BXfb5zTru395OfrGHjAK+KszznQmXfAN7CDXinBORAbyrQ6aT3+OsCpk1
 M1cRJEAJDP3TPUGbbDWNnC6i/HHdZ2mEcRCxmEeIBGXOkVA4uXH2azcGS/QQV+yTprOJ
 EL/52eFp6WR4qtqlndr+CLguE8DT8bk4exlg5ia61WTlq/J+XKlqdhw57JtdKRwd7Xid
 vQ5YZz9bvAKURcJ7ePl29zPczNJtrFpMRgxFsOeduL84HMnhYyoNokPU7Sx1XPqFj/+6
 KClA/J6XBi1H9IwoxTll/NfRnDIaeC6/ZRZm5bpp/flLKfFzjBjKnjFnuXVT3dlIBLih HQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfqtsw3ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 06:19:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M40YB6027309;
	Wed, 22 Mar 2023 06:18:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3pd4x6cmtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 06:18:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M6IvVi55574874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 06:18:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20C9A20040;
	Wed, 22 Mar 2023 06:18:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 945152004B;
	Wed, 22 Mar 2023 06:18:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Mar 2023 06:18:56 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 51265600F5;
	Wed, 22 Mar 2023 17:18:53 +1100 (AEDT)
Message-ID: <d6b00ea8c9282434ad5bed97fe567e91f847a4ac.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: Fix notifiers being shared by PCI and
 VIO buses
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 22 Mar 2023 17:18:52 +1100
In-Reply-To: <20230322035322.328709-1-ruscur@russell.cc>
References: <20230322035322.328709-1-ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CMROFekB5HAybCmujJHsn1Smyn6gS7US
X-Proofpoint-GUID: CMROFekB5HAybCmujJHsn1Smyn6gS7US
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 phishscore=0 mlxlogscore=928 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220043
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-03-22 at 14:53 +1100, Russell Currey wrote:
> fail_iommu_setup() registers the fail_iommu_bus_notifier struct to
> both
> PCI and VIO buses.=C2=A0 struct notifier_block is a linked list node, so
> this
> causes any notifiers later registered to either bus type to also be
> registered to the other since they share the same node.
>=20
> This causes issues in (at least) the vgaarb code, which registers a
> notifier for PCI buses.=C2=A0 pci_notify() ends up being called on a vio
> device, converted with to_pci_dev() even though it's not a PCI
> device,
> and finally makes a bad access in vga_arbiter_add_pci_device() as
> discovered with KASAN:
>=20
> =C2=A0BUG: KASAN: slab-out-of-bounds in
> vga_arbiter_add_pci_device+0x60/0xe00
> =C2=A0Read of size 4 at addr c000000264c26fdc by task swapper/0/1
>=20
> =C2=A0Call Trace:
> =C2=A0[c000000263607520] [c000000010f7023c] dump_stack_lvl+0x1bc/0x2b8
> (unreliable)
> =C2=A0[c000000263607560] [c00000000f142a64] print_report+0x3f4/0xc60
> =C2=A0[c000000263607640] [c00000000f142144] kasan_report+0x244/0x698
> =C2=A0[c000000263607740] [c00000000f1460e8] __asan_load4+0xe8/0x250
> =C2=A0[c000000263607760] [c00000000ff4b850]
> vga_arbiter_add_pci_device+0x60/0xe00
> =C2=A0[c000000263607850] [c00000000ff4c678] pci_notify+0x88/0x444
> =C2=A0[c0000002636078b0] [c00000000e94dfc4]
> notifier_call_chain+0x104/0x320
> =C2=A0[c000000263607950] [c00000000e94f050]
> blocking_notifier_call_chain+0xa0/0x140
> =C2=A0[c000000263607990] [c0000000100cb3b8] device_add+0xac8/0x1d30
> =C2=A0[c000000263607aa0] [c0000000100ccd98] device_register+0x58/0x80
> =C2=A0[c000000263607ad0] [c00000000e84247c]
> vio_register_device_node+0x9ac/0xce0
> =C2=A0[c000000263607ba0] [c0000000126c95d8]
> vio_bus_scan_register_devices+0xc4/0x13c
> =C2=A0[c000000263607bd0] [c0000000126c96e4]
> __machine_initcall_pseries_vio_device_init+0x94/0xf0
> =C2=A0[c000000263607c00] [c00000000e69467c] do_one_initcall+0x12c/0xaa8
> =C2=A0[c000000263607cf0] [c00000001268b8a8]
> kernel_init_freeable+0xa48/0xba8
> =C2=A0[c000000263607dd0] [c00000000e695f24] kernel_init+0x64/0x400
> =C2=A0[c000000263607e50] [c00000000e68e0e4]
> ret_from_kernel_thread+0x5c/0x64
>=20
> Fix this by creating separate notifier_block structs for each bus
> type.
>=20
> Fixes: d6b9a81b2a45 ("powerpc: IOMMU fault injection")
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
