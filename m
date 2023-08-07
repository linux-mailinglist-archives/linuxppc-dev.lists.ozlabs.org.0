Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A242177192D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 06:55:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GX2aW48W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK3sz3N36z2yV8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 14:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GX2aW48W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK3s36Wfcz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 14:54:47 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3774eI6j002666;
	Mon, 7 Aug 2023 04:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+zs5svu4nZLl3lS1JtxPWKu//slmeo0oxKb/abzUZe4=;
 b=GX2aW48W6r4bTnLyzkm67J//uvx6tmWzFUTwx2Odqr0jAVZ5amQRzgoo83ODiJ5k05qt
 ax6JgTox9xSp4abMKCdp4XorNIFI0u2wtf4q9UU6AFltvopABsQEmSyXHcnoV4Y71w21
 AufBl+MhiW/OOxYbsxJop6SZFCodnkZbqAUszleCVEZEZSx6dw7VGO8KHK/itCzMOwlZ
 zYQ/Gm29IWE2tIYJvH2I4y5CBECBiZedN3uqeV/Kxlv5QvqJDl6FHHdhwTW+Zb1tjrJj
 CCFOMGd914llIJ/vEPjEM52ICh1X1ecLQAKpcXGlm3gPuHz6yJF9IUSzdGEa4U5tHrLR Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sasjh8cre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:54:24 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3774nUYM031993;
	Mon, 7 Aug 2023 04:54:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sasjh8cqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:54:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37748Y66000402;
	Mon, 7 Aug 2023 04:54:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa28k1y29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:54:21 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3774sJN527198000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 04:54:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2C5520043;
	Mon,  7 Aug 2023 04:54:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22AEB20040;
	Mon,  7 Aug 2023 04:54:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Aug 2023 04:54:19 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2A7FB600E5;
	Mon,  7 Aug 2023 14:54:16 +1000 (AEST)
Message-ID: <b521f1165104d67e08d016f96a9e3579489ee9f4.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] ocxl: use pci_find_next_dvsec_capability() to
 simplify the code
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>, bhelgaas@google.com,
        fbarrat@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, arnd@arndb.de, gregkh@linuxfoundation.org,
        ben.widawsky@intel.com
Date: Mon, 07 Aug 2023 14:54:15 +1000
In-Reply-To: <20230807031846.77348-3-wangxiongfeng2@huawei.com>
References: <20230807031846.77348-1-wangxiongfeng2@huawei.com>
	 <20230807031846.77348-3-wangxiongfeng2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zl2I8h13MNT0KFsOGL2X415LDyWSfIT8
X-Proofpoint-ORIG-GUID: mRqkIifrXOH76M1qs7LZL7JNP9vHDSUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_02,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=615 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308070041
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
Cc: linux-pci@vger.kernel.org, yangyingliang@huawei.com, linuxppc-dev@lists.ozlabs.org, jonathan.cameron@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-08-07 at 11:18 +0800, Xiongfeng Wang wrote:
> PCI core add pci_find_next_dvsec_capability() to query the next
> DVSEC.
> We can use that core API to simplify the code. Also remove the unused
> macros.
>=20
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
