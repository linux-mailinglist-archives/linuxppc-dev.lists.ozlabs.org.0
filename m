Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A408D9CD39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 12:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H7HC1cwWzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 20:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H7BY3NDrzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:13:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46H7BX26Zrz8svw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:13:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46H7BW6t8hz9sDB; Mon, 26 Aug 2019 20:13:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46H7BW29g8z9sN1
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 20:13:39 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QA8HQ1080318
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 06:13:37 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umbpfv0gd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 26 Aug 2019 06:13:37 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Mon, 26 Aug 2019 11:13:32 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Aug 2019 11:13:30 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7QADTqD23986202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 10:13:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4841B52051;
 Mon, 26 Aug 2019 10:13:29 +0000 (GMT)
Received: from [9.199.196.197] (unknown [9.199.196.197])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A5F425204F;
 Mon, 26 Aug 2019 10:13:28 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20190826090905.GA1792@in.ibm.com>
Date: Mon, 26 Aug 2019 15:43:27 +0530
Content-Transfer-Encoding: quoted-printable
References: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
 <20190826090905.GA1792@in.ibm.com>
To: ego@linux.vnet.ibm.com
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19082610-0020-0000-0000-0000036411AA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082610-0021-0000-0000-000021B958C0
Message-Id: <D852BB99-DFA8-4A0A-ADE6-0CCB7302D2FA@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=774 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260112
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
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Aug-2019, at 2:39 PM, Gautham R Shenoy <ego@linux.vnet.ibm.com> =
wrote:
>=20
>> c000000000055198] start_secondary+0x638/0x680
>> [   40.285680] [c0000007f5527f90] [c00000000000ac5c] =
start_secondary_prolog+0x10/0x14
>> [   40.285680] Instruction dump:
>> [   40.285681] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 =
f821fe21 e90d1178=20
>> [   40.285684] f9010198 39000000 892d0988 792907e0 <0b090000> =
39200002 7d210164 39200003=20
>> [   40.285687] ---[ end trace 72c90a064122d9e4 ]=E2=80=94
>=20
> Could you please share the test-case that you were running and the
> command line parameter ?

No test was run. Only a boot test.

Thanks
-Sachin=

