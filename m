Return-Path: <linuxppc-dev+bounces-902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D19693A2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 08:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WybK00ts4z2y8l;
	Tue,  3 Sep 2024 16:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725344868;
	cv=none; b=PPKkoc2ckpa2QRNWmtQwxaR1ARjA9/eexp5Oa7SgwDrw7S9gaECpKU6QV/3smtA/+oPg04K5N8BA+oy8dodR/j5hfsIuJvA+Xj233TncaQnwdIrRB+kN+LyDBLI2L+9S5ILOv/9KAYmfZRy9k+mpw/jJKnUASLZSmzk+cXsEHQqgdGpmNuzSJKtoy/qaHVu4FXPYn2n7eH7t5caIhdmWcMkAGnKJCtCxURCgD52fVERQ7WHy0UVi7+OZkgSZ/7vFwpkBwMfoyimF5wEbh4PxuAxAXXNZ5kQTAP6aEs775RcRogXBHFMrqiWL/tU8U2lEceNRePDuHnCqHUPCWBMQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725344868; c=relaxed/relaxed;
	bh=VgrxN144iUPf7NqeoMOyzsSN98GEfqKoLsawzlynxPg=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=Y4y9DHJ1uMkaKASfpArV36cVciEzbW+BGPlMLe9IaHF5VYmA0LTBjhvjeE53ofi9aBqEJ33/fNldmpXlyK8UNPnodKWGcjsaqOCBpl3QcG9JOFmpwDZX3EZ3ABP9+yF+w1hieku8Kq344GeEBrjnWn3yEu9a4gcUV6rkVZ1Vmm80cXuV65lSbV00f2VK2qXttqHbmmCmMuXytc3lAi+fKd2xFSkki2WEBfCbA8RM6j+bKCTzgvc5gkNuRm/S9r7tJUbqoO5rPgCsmz8VkaS5g6GIMQIFNUl9KUc1JOid8r6wiaQtScdWl2Q9Y6PdjcDc8u4uREKmgfGWjKJAa3e50A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzESbfHi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzESbfHi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WybJz0Thkz2xch
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 16:27:46 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482MmnT9025891;
	Tue, 3 Sep 2024 06:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:mime-version:content-type; s=pp1; bh=VgrxN144iUPf7NqeoMOyzsSN98
	GEfqKoLsawzlynxPg=; b=rzESbfHimjo981rF1eOvgpMSjsCQ2UXY78JmMhDEPZ
	DPh07gQoAfNtgrqCnJFv+HngQ73My+guTlInZU4UAvE+Dm9dcfsYpQEIqRqoVG6I
	obVtiqyrCd8ZtLNynhBiS1xKvLMAi/spun5PMu9Eab4stcoNMpzU0EqMEfHF9k64
	+Lwt5vXL3GQWmcwF7+U+6eOVKzqSx/n6WbnE3sku4HNati9Ia2vVLoEPV1PxeuvG
	3fui9eN9a0KkNJJxBS5E1cd0jLPmZSXe5AuC2X3sdunUJeNgYrgy4e73/Bna0Inl
	PYj52ozWBoOg+tVNxtsqs4KH9vbGLWVO9WCW8G0uWdcA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41brkqmhru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:27:23 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4836RNUi007387;
	Tue, 3 Sep 2024 06:27:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41brkqmhrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:27:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4832HPjd012052;
	Tue, 3 Sep 2024 06:27:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41cegpse6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:27:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4836RKVJ14483918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Sep 2024 06:27:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1289B2004D;
	Tue,  3 Sep 2024 06:27:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BD9820040;
	Tue,  3 Sep 2024 06:27:19 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  3 Sep 2024 06:27:19 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
        jeffxu@google.com, Liam.Howlett@oracle.com,
        linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
        pedro.falcato@gmail.com, linux-um@lists.infradead.org,
        linux-s390@vger.kernel.org,
        Ravi Bangoria
 <ravi.bangoria@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
In-Reply-To: <CAHk-=wjD0XLhkzou89J-TK=L6B88pFoNYxN1uTWRQB3U5Czywg@mail.gmail.com>
	(Linus Torvalds's message of "Mon, 2 Sep 2024 14:02:56 -0700")
References: <20240812082605.743814-1-mpe@ellerman.id.au>
	<20240819185253.GA2333884@thelio-3990X>
	<yt9dy149vprr.fsf@linux.ibm.com>
	<20240902134953.e834bc2e57d36b1d3b1397e4@linux-foundation.org>
	<CAHk-=wjD0XLhkzou89J-TK=L6B88pFoNYxN1uTWRQB3U5Czywg@mail.gmail.com>
Date: Tue, 03 Sep 2024 08:27:19 +0200
Message-ID: <yt9dr0a1uu9k.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9aSqu6fFfWss73YgKp0gBlzFQVIXapXn
X-Proofpoint-ORIG-GUID: OxhEA4e_rV3dfcm0C7DWi8uVqyGWdHzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=970 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030046

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Mon, 2 Sept 2024 at 13:49, Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> uprobe_clear_state() is a pretty simple low-level thing.  Side-effects
>> seem unlikely?
>
> I think uprobe_clear_state() should be removed from fork.c entirely,
> made 'static', and then we'd have
>
>         area->xol_mapping.close = uprobe_clear_state;
>
> in __create_xol_area() instead (ok, the arguments change, instead of
> looking up "mm->uprobes_state.xol_area", it would get it as the vma
> argument)
>
> That's how it should always have been, except we didn't have a close() function.
>
> Hmm?

Indeed, that's much better. I'll prepare a patch.

Thanks!

