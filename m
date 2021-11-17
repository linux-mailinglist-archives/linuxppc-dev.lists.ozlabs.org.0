Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C6453E96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:50:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv6qL4lQPz30J3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 13:50:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=imVi/Wz/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=imVi/Wz/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv6pd317tz2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 13:49:44 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH2lAr5025614; 
 Wed, 17 Nov 2021 02:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ITGoMWns1hM/Xx0Xr97IulMjXe1fOz5Mv22KIOiASAg=;
 b=imVi/Wz/7FHK2y8oEfCbONCWRCFDqj1wjLLBLmx4Ysu5AEZMFsTrPaLjFATjnqM3t7Hz
 Gz605fNbpMTC61hyG9vXBCLF+6FrRNzBoPXoG8oh5ozuLou37dM+bTiJHGQ284uNUCmk
 E1kHU/5ytId4w/uaorKqwuic2yOtkhtMXy0OO0u/E62TH6sGGKhr/unsq7xxAPR+0TKT
 mXRXowrBKuMHdxN78o/vAjMEGulVGcCO9Ytyy86EDpXPRDJFvj31stg6wsyWfn3MPyVO
 TWKtKVTHd+tLkI0ksR4UuZ3pztWyLIKiac7rIaE97gqRMRnkhiDEaEAkL+SFma62R+7H 1g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccs8jr0mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 02:49:38 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH2hfdO015685;
 Wed, 17 Nov 2021 02:49:37 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3ca50ba653-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 02:49:37 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AH2maKj57606608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 02:48:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7188C28060;
 Wed, 17 Nov 2021 02:48:36 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B0F228058;
 Wed, 17 Nov 2021 02:48:36 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 02:48:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: delete scanlog
In-Reply-To: <20210920173203.1800475-1-nathanl@linux.ibm.com>
References: <20210920173203.1800475-1-nathanl@linux.ibm.com>
Date: Tue, 16 Nov 2021 20:48:35 -0600
Message-ID: <87sfvvijjw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0pVinnyHsq3lUteztnn6-mVjg2Cn8WZn
X-Proofpoint-GUID: 0pVinnyHsq3lUteztnn6-mVjg2Cn8WZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_01,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=789 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170007
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Remove the pseries scanlog driver.
>
> This code supports functions from Power4-era servers that are not present
> on targets currently supported by arch/powerpc. System manuals from this
> time have this description:
>
>   Scan Dump data is a set of chip data that the service processor gathers
>   after a system malfunction. It consists of chip scan rings, chip trace
>   arrays, and Scan COM (SCOM) registers. This data is stored in the
>   scan-log partition of the system=E2=80=99s Nonvolatile Random Access
>   Memory (NVRAM).
>
> PowerVM partition firmware development doesn't recognize the associated
> function call or property, and they don't see any references to them in
> their codebase. It seems to have been specific to non-virtualized
> pseries.

Just bumping this to see if there are any objections.
