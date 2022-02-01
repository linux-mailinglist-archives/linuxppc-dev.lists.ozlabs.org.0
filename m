Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047E4A611D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 17:13:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp93965Frz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 03:13:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a5iAxCue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a5iAxCue; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp92N05D9z2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 03:12:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211F8j1e000551; 
 Tue, 1 Feb 2022 16:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=XMzmuPPsYYUsDpr+TRFktn0L5nAOjM+NFLm/57338dc=;
 b=a5iAxCueEuc9fM9Bs84XDDcmwYofpf+KCmDdY6xGYzHjgec79pTQSLrKcoU1CZ5vhb+C
 ZBKCgwn6/ays581PllZFzGWLuTM2MOmGfujCp5cKLhe3wGIxNxFveFS2zXJfUccuulr+
 ViO/Xu/ddzGNvJ3dn4O5Lj07AmZJKlHAkwGIwlnZ3nnBMoDMHj+uQzZGiQ9W9ie68HYU
 7LmcZSO/XMqa+uuHsPguTlq/kUs0c/zizwsBD3wcgznxbpIv1AwZeP+/t50icjH1Qg8V
 QegO79jxiMhoNz4yvN1PFEOB4xuotOHfxCLTIcahS6jNnJwFGa1aBdaBruJujjX+rc7x aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxrbm2e0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 16:12:53 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211FxXYc029734;
 Tue, 1 Feb 2022 16:12:53 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxrbm2e0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 16:12:53 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211GCMXY018260;
 Tue, 1 Feb 2022 16:12:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3dvw7av4sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 16:12:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211GCmeB29753758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 16:12:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFC2E7807B;
 Tue,  1 Feb 2022 16:12:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A6778063;
 Tue,  1 Feb 2022 16:12:48 +0000 (GMT)
Received: from localhost (unknown [9.160.114.203])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Feb 2022 16:12:48 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: Re: [PATCH 2/3] powerpc/pseries/vas: Add VAS migration handler
In-Reply-To: <17bb8ed6bfc450ec89bd12169d43858a2ba33bca.camel@linux.ibm.com>
References: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
 <55dc807fe7f2c8989d267c70b50c5af5c0b22f00.camel@linux.ibm.com>
 <87o83rzws1.fsf@linux.ibm.com>
 <17bb8ed6bfc450ec89bd12169d43858a2ba33bca.camel@linux.ibm.com>
Date: Tue, 01 Feb 2022 10:12:47 -0600
Message-ID: <87mtjasgzk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sEckWz0c76bxtwleQG3ArvA_5pm77MeD
X-Proofpoint-ORIG-GUID: 2B5tRtlbErVh3j7htUZdshRQb7N-4iEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_08,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=930
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010091
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> On Mon, 2022-01-31 at 10:37 -0600, Nathan Lynch wrote:
>> Haren Myneni <haren@linux.ibm.com> writes:
>> > Since the VAS windows belong to the VAS hardware resource, the
>> > hypervisor expects the partition to close them on source partition
>> > and reopen them after the partition migrated on the destination
>> > machine.
>> 
>> Not clear to me what "expects" really means here. Would it be
>> accurate to say "requires" instead? If the OS fails to close the
>> windows before suspend, what happens?
>
> I will change it to 'requires' - These VAS windows have to be closed
> before migration so that these windows / credits will be available to
> other LPARs on the source machine.

I'll rephrase.

I want to know whether the architecture (PAPR or whichever doc) imposes
a requirement on the OS (i.e. using words like "must") to close the
windows, or does it merely make a recommendation ("should"), or is it
silent on the subject?

In your testing, if Linux has windows open at the time of calling
ibm,suspend-me, does the call fail or succeed?
