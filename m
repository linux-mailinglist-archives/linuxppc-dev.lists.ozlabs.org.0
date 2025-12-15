Return-Path: <linuxppc-dev+bounces-14783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 707EDCBF707
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 19:33:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVTG64xjCz2yFK;
	Tue, 16 Dec 2025 05:33:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765823598;
	cv=none; b=jsihjCsKkLfpZesgcZjlAJMjxUuG+3iZcsrirNLNTmF+QdyEILhnFEu1XAQcOdAZGYTlYWMJTY9RBL3AQLqOETQ+yLPu7Ha2ZUsM5YMRNaetjFxK4w/b7jsBgjhWOR3sorqwcHwRNeK1UxyFKmD5KPq0Ckt/V71CZzq/DwC7xvVp21GID6ulr4H/bDHwZgrGiSfFd6W7dPLqBlXH0abDsKvxaieFpIIipYG5vAtzCV1xfzUsds1FCPtx3ysbdy4uxs4ZgzxKf30aEWRc45c98OsSDlIqeqIRlrE63UhKZ8+rjHXWEEHz3GDZ38RAXTzrBHMSbBSBqKRTvJ/H/5r+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765823598; c=relaxed/relaxed;
	bh=jLELPByEUxexzFFhslrcDarH5jfAonTYvLdyIbJRi4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYS07nnCjbRqXNDtdyoaRDC6E76sB5UtTxO+qcrWS+ixyUoJX0qzM2JWTg2wzvLN8fFvZ8/nsfGrTtG7e/UC3TN6mNoikqNchQohGncY1sMMk1r0u/SQ3SGFmDHBHPPKM3ECwbRNM2+euuSGdrZl3lLimuH9cl7RiBuNCofTamfBySNtksHskU8wcJvncmwVgLRpIvUavTNxYCdksYEjOYkXE/UpJ+JEBleAnVMGoMMRIdDwqLWQfbBNWMaZKckre5HhyJQWgmHH3RHgT5Zr0HxCOGEjGc33LPoK4jEPbjmr83718NEkI5phMTF8AAzifaRqpL8mfIHh9oOaKK5FZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SqhVZtfM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SqhVZtfM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVTG50hD4z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 05:33:16 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFGc2ni021469;
	Mon, 15 Dec 2025 18:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jLELPB
	yEUxexzFFhslrcDarH5jfAonTYvLdyIbJRi4s=; b=SqhVZtfMgnjNFpAvEBKHHk
	OGxx3ez6YiEAg5AnKkgNd9O9S+VnMUbhovgIGzqM/smX/ulXuIuOR96L3e/vuNix
	zu1HnFBl1HjS1jIWj2ddIozrCm8wQhJweJH6wEW2eqcFx47CrGO9iZW7l5OYJawt
	RCWPNmFV2ujMCYCzvoXShYyARisMRlLYsBoG58zHDPLiNqghRPsRBEXaUl8PxwJq
	dYxBkzS91e1nXbpcgYMmxSpewsoxdHK0K7fxBeVWWgNOyUm46xQoBbk0HTrrOfHo
	L6tZ55QLSESqO/j0QPgc0ioL5zpZ23gXla9xQ2d2B7prWvdGUF41WmgEaOCyyxLQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjpu6jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 18:32:34 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BFITwaw004128;
	Mon, 15 Dec 2025 18:32:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjpu6j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 18:32:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFHemIG012788;
	Mon, 15 Dec 2025 18:32:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1juy067v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 18:32:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BFIWSbg21365194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Dec 2025 18:32:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C8C120043;
	Mon, 15 Dec 2025 18:32:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17A1020040;
	Mon, 15 Dec 2025 18:32:20 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.209.13])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 15 Dec 2025 18:32:19 +0000 (GMT)
Date: Tue, 16 Dec 2025 00:02:15 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, thuth@redhat.com, sshegde@linux.ibm.com,
        charlie@rivosinc.com, macro@orcam.me.uk, akpm@linux-foundation.org,
        ldv@strace.io, deller@gmx.de, ankur.a.arora@oracle.com,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <lv6iie4ykgxbwemnhrwsao3qc6oq52lugk7rkjcvh26cubcp55@rwudr7xpnlif>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-9-mkchauras@linux.ibm.com>
 <aT7jvN1u8P7XxQIW@gate>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aT7jvN1u8P7XxQIW@gate>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwMSBTYWx0ZWRfXyO8N6kTPrp8V
 6U+wQiPVFLNkrshE/RrBQnWBT96OQ1l6C5CYc9pc1G2wjjNj4allwugff8wYPrYkvK3rljgnc11
 vfqemJi8bI+YtYsS8LIwhhIYJZAl8xfbKazYjJZ067jIIc19xTj8liXZNOnAaji+x1+/DPJr/Pm
 noRkp5AWDhmNVqtC77Je73mngYa9DF3wz93Hh4Zk5QdN96LZfG4Ao8eHjqYkV9yoqdz9cQEaUpl
 +ciKJ2B8JvJ5nr8bJEs7Yt3E8pEfNCUpOVfgBOlobwUKGLnhu0yc3qVEde4cuCvEhySsmpSbkIZ
 j2xU1b+Fk4/f8ofphwxWeAJeLu0ihll+yusPC66sDYewZtDVbArtZEpmN3E4WYMm74Mrcc9z3jy
 0FIc9ea0yFxjNfRI/Rf33DRjlrzF0w==
X-Proofpoint-GUID: ZDmEe3IkAXAxGOjqYJ_veo-i5HgpI-VP
X-Proofpoint-ORIG-GUID: KJQk2dgwfkvQMH2yw7B3b5bq_J-kSg0Q
X-Authority-Analysis: v=2.4 cv=Kq5AGGWN c=1 sm=1 tr=0 ts=69405442 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XFZDKkglJf05v6qjiQ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Dec 14, 2025 at 10:20:12AM -0600, Segher Boessenkool wrote:
> Hi!
> 
> On Sun, Dec 14, 2025 at 06:32:44PM +0530, Mukesh Kumar Chaurasiya wrote:
> > 
> > | Test            | With Patch | Without Patch | % Change |
> > | --------------- | ---------- | ------------- | -------- |
> > | fork usec/op    | 833.986    | 814.809       | +2.35%   |
> 
> What causes this regression, did you investigate?  Maybe there is
> something simple you can do to avoid this degradation :-)  All other
> numbers look just fine :-)
> 
Hey,

I ran this multiple times and took the average this time, below are the
results:
===========================================
Without patch
===========================================
╰─❯ perf bench syscall fork 
# Running 'syscall/fork' benchmark:
# Executed 10,000 fork() calls
     Total time: 8.514 [sec]

     851.415300 usecs/op
          1,174 ops/sec

╰─❯ perf bench syscall fork
# Running 'syscall/fork' benchmark:
# Executed 10,000 fork() calls
     Total time: 8.572 [sec]

     857.293600 usecs/op
          1,166 ops/sec

╰─❯ perf bench syscall fork 
# Running 'syscall/fork' benchmark:
# Executed 10,000 fork() calls
     Total time: 8.695 [sec]

     869.536500 usecs/op
          1,150 ops/sec
===========================================
With patch
===========================================
╰─❯ perf bench syscall fork 
# Running 'syscall/fork' benchmark:
# Executed 10,000 fork() calls
     Total time: 8.482 [sec]

     848.241300 usecs/op
          1,178 ops/sec

╰─❯ perf bench syscall fork 
# Running 'syscall/fork' benchmark:
# Executed 10,000 fork() calls
     Total time: 8.623 [sec]

     862.389000 usecs/op
          1,159 ops/sec

╰─❯ perf bench syscall fork 
# Running 'syscall/fork' benchmark:
# Executed 10,000 fork() calls
     Total time: 8.530 [sec]

     853.037200 usecs/op
          1,172 ops/sec
===========================================
Average:
===========================================
With Patch:
854.4964 usecs/op
1169 ops/sec

Without patch:
859.4151 usecs/op
1163 ops/sec

That's ~0.5% improvement when i take average through the runs.
This we can ignore as a standard deviation and consider that there are
no regression for these.

Regards,
Mukesh

> > | Test            | With Patch | Without Patch | % Change |
> > | --------------- | ---------- | ------------- | -------- |
> > | fork ops/sec    | 1,199      | 1,227         | -2.28%   |
> 
> (Same thing seen from another side)
> 
> 
> Segher

