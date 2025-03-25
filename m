Return-Path: <linuxppc-dev+bounces-7324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F1A6F648
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 12:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMSlY5dBKz2yFJ;
	Tue, 25 Mar 2025 22:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742903113;
	cv=none; b=V7bVT/sTGe6NoY6XT/+1t+OiKPJDlExGluNWPdCZAmQb5mrFz9MynTdiv3luQbxbfUk+Alh65bXhN/kq26GpM92p1DghBRxbQCd0BRlhuUrzq7zMewVFuPhM/H7QfJk0dmiH3x/EMoYzAGMHsvWJk4kF6kIPPbg996jq6yECwXReh/gX0s2S02yb+xIj3IJ4TSjmi0AtC/V7TfnWmgRmz9k85jGirCzCz5BOQBVantGYoaNen7UEx0+0gV7DB3HXtQX2ASXocM4TaejIsX0eRDDLU76OrSAO6KHVL+Njtpa0S7aOW4J41L79FT0pFudHP6bQa/jCyZNa8WfYVsweaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742903113; c=relaxed/relaxed;
	bh=ZeSvWIeDWkZDUBR4rtlXsoPy9rqPVDRaaZ2ycwV8IUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGSPjm3347UXr2edyj2faN6dewRAbdWUxmRKJPeCpixt9rXmHZmi0BrE1N3Z8mwWdwMSOTYS4eA/6iSKKK1S9o1SQwAtOGukrUAjJPAvUrTg/S9nLrev/mbfPXiBmRnEqD4QdwTKXhXthFFr5YbLSJaACL0hllsYH5vhBWaSxoaDkM2QZzIXF10BDOGMgMNFJOO2yfkVf/bXF1oZriKRv9p4wzjC3FZSq/LWZdZFJLZMNGkN8JAEx2438XbBbnYjKncFRwTm+NWLQ5Ntp4N5Dbc0XtFBgFB5Gb5q37dk5ziPi65Sah0E1VuT5ccX3c9hKyJe8KMIh0D+21UARYk1Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EVjLbNU/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EVjLbNU/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMSlX3kf4z2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 22:45:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P56dKK027910;
	Tue, 25 Mar 2025 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ZeSvWIeDWkZDUBR4rtlXsoPy9rqPVD
	RaaZ2ycwV8IUc=; b=EVjLbNU/k5+hqrBMGzGH/Fx07OdHl42M4QPRgyplfcTT6J
	MwoJFMiFn5ij4vtQYKZws4avcfDpsg8HTGu+yk4smIpknNF1/LkS9KUAqwNixD79
	ad7FOtrMtYWSfMK+0y/k+iBDcS6qO2SkUM7X6JDEdc0QPeNWVoTr+oIu2kRcRv28
	DH0NIcG89cBtHwrkcT21EncIaY9Q921n7hd3XwjNstgoRdi+kOoqJidlt36eXkrq
	6W2i1ELzPn0x3ZKkp92ZwW92S6D4xMHM8O766zh98f74mqdkawWrPoNExbZDg3KS
	b4KT6ZUcufkzDEdKg+dAFe6vpOlRQKkw/S04GkGA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kbjwvae5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 11:45:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52PA0TZm009692;
	Tue, 25 Mar 2025 11:45:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j9rkjy33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 11:45:05 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52PBj2hk35258764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 11:45:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41C5120043;
	Tue, 25 Mar 2025 11:45:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D19320040;
	Tue, 25 Mar 2025 11:44:59 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.43.39.189])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Mar 2025 11:44:58 +0000 (GMT)
Date: Tue, 25 Mar 2025 17:14:55 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Quentin Monnet <qmo@qmon.net>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com,
        williams@redhat.com, tglozar@redhat.com, rostedt@goodmis.org
Subject: Re: [linux-next-20250324]/tool/bpf/bpftool fails to complie on
 linux-next-20250324
Message-ID: <Z+KXN0KjyHlQPLUj@linux.ibm.com>
References: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
 <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6J8TeICOWrWWtMDx4atpNlqvb8kZ_Apf
X-Proofpoint-ORIG-GUID: 6J8TeICOWrWWtMDx4atpNlqvb8kZ_Apf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503250080
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 25, 2025 at 11:09:24AM +0000, Quentin Monnet wrote:
> 2025-03-25 16:02 UTC+0530 ~ Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Greetings!!!
> > 
> > 
> > bpftool fails to complie on linux-next-20250324 repo.
> > 
> > 
> > Error:
> > 
> > make: *** No rule to make target 'bpftool', needed by '/home/linux/
> > tools/testing/selftests/bpf/tools/include/vmlinux.h'. Stop.
> > make: *** Waiting for unfinished jobs.....
> 
> 
> Thanks! Would be great to have a bit more context on the error (and on
> how to reproduce) for next time. Bpftool itself seems to compile fine,
> the error shows that it's building it from the context of the selftests
> that seems broken.
> 
> 
Yes, selftest build for BPF fails.
## pwd
/linux/tools/testing/selftests/bpf

# make -j 33

make: *** No rule to make target 'bpftool', needed by '/home/upstreamci/linux/tools/testing/selftests/bpf/tools/include/vmlinux.h'.  Stop.
make: *** Waiting for unfinished jobs....

> > Git bisect points to commit: 8a635c3856ddb74ed3fe7c856b271cdfeb65f293 as
> > first bad commit.
> 
> Thank you Venkat for the bisect!
> 
> On a quick look, that commit introduced a definition for BPFTOOL in
> tools/scripts/Makefile.include:
> 
> 	diff --git a/tools/scripts/Makefile.include .../Makefile.include
> 	index 0aa4005017c7..71bbe52721b3 100644
> 	--- a/tools/scripts/Makefile.include
> 	+++ b/tools/scripts/Makefile.include
> 	@@ -91,6 +91,9 @@ LLVM_CONFIG	?= llvm-config
> 	 LLVM_OBJCOPY	?= llvm-objcopy
> 	 LLVM_STRIP	?= llvm-strip
> 	
> 	+# Some tools require bpftool
> 	+BPFTOOL		?= bpftool
> 	+
> 	 ifeq ($(CC_NO_CLANG), 1)
> 	 EXTRA_WARNINGS += -Wstrict-aliasing=3
> 
> But several utilities or selftests under tools/ include
> tools/scripts/Makefile.include _and_ use their own version of the
> $(BPFTOOL) variable, often assigning only if unset, for example in
> tools/testing/selftests/bpf/Makefile:
> 
> 	BPFTOOL ?= $(DEFAULT_BPFTOOL)
> 
> My guess is that the new definition from Makefile.include overrides this
> with simply "bpftool" as a value, and the Makefile fails to build it as
> a result.
> 
> If I guessed correctly, one workaround would be to rename the variable
> in Makefile.include (and in whatever Makefile now relies on it) into
> something that is not used in the other Makefiles, for example
> BPFTOOL_BINARY.
> 
> Please copy the BPF mailing list on changes impacting BPF tooling (or
> for BPF-related patchsets in general).
> 
> Thanks,
> Quentin
Yes you are right that the new definition from Makefile.include overrides this
with simply "bpftool" as a value, and the Makefile in bpf selftest fails to 
build it as a result.

But the main cause is that it is not able to locate the bpftool binary.
So, is it good idea to both rename this variable in Makefile.include and 
use:

BPFTOOL ?= /usr/sbin/bpftool

This is the link to patch that is impacting: 
https://lore.kernel.org/all/20250218145859.27762-3-tglozar@redhat.com/

Thanks,
Saket

