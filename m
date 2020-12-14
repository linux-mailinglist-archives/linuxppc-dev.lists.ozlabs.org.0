Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0D2D96A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 11:54:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvdZD6rYKzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 21:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NkQPI8Wp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvdXq29VRzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 21:53:31 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BEAgRim013643; Mon, 14 Dec 2020 05:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=PE0rZt60ZTfWmk21Zw03rCMUftC0XN/Aq8mECYOMU34=;
 b=NkQPI8WpwRUEWezdrKFwczr1eLUyP9iqRY1DYUwzp/8uereokjTZSNARSJuoUiXCtKIB
 MCqeg/WQ4BI1AH/bliZYM16a286oiHMNXJ7HA/o8EsW6BDzbOFyE1G60o8PhVhyWv4VT
 Tyz83B+1UfVIybOKTzrHPf+2nPO7zOoUpVgSESXkHmp7pTTm6QKYTA2GOiCyODOXmtN1
 N1v41r2IcfH+xK8pkcBNKg4FQ5bEbD0iywPsY5lM2pPAVX8/EfD6oKtV/Sch72rE21Q1
 PUl1YSTYoWuZfAWvU2RwKfnMaGTG4Ytg3E0KwfGnPFr0G0zHHN0KojmTMq4ADDiAVyWK Vg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35e6hfr8mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 05:53:25 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BEAhwi4022206;
 Mon, 14 Dec 2020 10:53:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 35cn4ha2j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 10:53:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BEArKVK30409132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 10:53:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1607142042;
 Mon, 14 Dec 2020 10:53:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C03542047;
 Mon, 14 Dec 2020 10:53:19 +0000 (GMT)
Received: from [9.102.1.15] (unknown [9.102.1.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 10:53:19 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH v2] powerpc/book3s/kup: Mark the kuap/keup function non
 __init
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20201214080121.358567-1-aneesh.kumar@linux.ibm.com>
Date: Mon, 14 Dec 2020 16:23:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <86CB1DAC-A345-4D35-A8FA-7884DF99E415@linux.vnet.ibm.com>
References: <20201214080121.358567-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.17)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_04:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=935
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140072
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 14-Dec-2020, at 1:31 PM, Aneesh Kumar K.V =
<aneesh.kumar@linux.ibm.com> wrote:
>=20
> The kernel call these functions on cpu online and hence they should
> not be marked __init.
>=20
> Fixes: 3b47b7549ead ("powerpc/book3s64/kuap: Move KUAP related =
function outside radix")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> =E2=80=94

This fixes the reported crash I ran into during a cpu online operation.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

-Sachin

