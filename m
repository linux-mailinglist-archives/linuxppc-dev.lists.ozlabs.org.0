Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE2212174
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 12:39:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yF2r72gJzDqwm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gKLSXxs5; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yDzV3mwnzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 20:36:38 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 207so12181314pfu.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zjqH5OyJ0uNgtW+k6QC+tgZu9cOQCPtDoHSfO1sMDg4=;
 b=gKLSXxs5Xi0ffOI4xaSGtq2l4qx855x5dafTHDq9WcXO7TQYplArFpssod2qR5iroc
 Z//J/E+Jxf2dWCBbYKBHXFVD+w+CXtshhKTHJdbD/O3iC89Fj08aafiZCVEJF2cOTrNE
 4O5RqYQhri/vkSqkCRh9y8WiBO96ojL+4z4rqkLZXntWV5WAPiQZgcI1l0fnRFTFW50B
 rnTXdlfNOfTTwQ8ZKKGlQmHh4n8MfQVtn/MOtzbdTacVyDrkzZeO+Bdvyer8wuGkuL/S
 WC2gdd9tZnGshLR1E2a6JkZgt2oEw8jXurog9U4CI9OV0MLCeiLynDz8keltOuHYW5qY
 QHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zjqH5OyJ0uNgtW+k6QC+tgZu9cOQCPtDoHSfO1sMDg4=;
 b=qJ5DD+xlOWM+AgV+Wwv0fFgDTTadki8TxeURS2be7CCluRO4Vya5ceKMoemvRUgSjB
 FUsiTWItNxEaKiPso2VFeQ7eGBRM+8ne4FDEfuAi/9L4SNfPzI4yLMY4vsPO+fNEYZ4F
 /7k6bKGc268FPScgu5mUZ+bZK0Y3bdp32Ry83c/2QTwXi7m9I6bsEFaVQ6aeOnYnTmC0
 Y2jmT9N3gaCL6hVoGZFNBVhgms1O0mJUNsUecutgbC7ka/FMycBOfo/S4+uzrMZyaWni
 yCmyuOujIrBYJyTSSdxLZ+CMAQooADwxMacKwUMUrv5s7jp1eY72JIL8Zmg8EvaPJLtY
 ZVDQ==
X-Gm-Message-State: AOAM530Gu6EcODgwn4FzwhDdTPd/5SaLfRpO9heRHnA52o5wfKFPc3p2
 tiqpcZZOCSxCSw2roTpo7KE=
X-Google-Smtp-Source: ABdhPJzDNFrzM9gHS1aXVkfvYMpILRrQRmwBPh5wcimghMwI/lqsx8PhEr//gfgskebXTyEDOTJ33g==
X-Received: by 2002:a63:8f18:: with SMTP id n24mr23072639pgd.432.1593686193761; 
 Thu, 02 Jul 2020 03:36:33 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id i128sm8838706pfe.74.2020.07.02.03.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:36:33 -0700 (PDT)
Date: Thu, 02 Jul 2020 20:36:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] powerpc/pseries: use smp_rmb() in H_CONFER spin yield
To: Peter Zijlstra <peterz@infradead.org>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-3-npiggin@gmail.com>
 <20200702082840.GC4781@hirez.programming.kicks-ass.net>
In-Reply-To: <20200702082840.GC4781@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1593685552.uh4kepm08t.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of July 2, 2020 6:28 pm:
> On Thu, Jul 02, 2020 at 05:48:33PM +1000, Nicholas Piggin wrote:
>> There is no need for rmb(), this allows faster lwsync here.
>=20
> Since you determined this; I'm thinking you actually understand the
> ordering here. How about recording this understanding in a comment?
>=20
> Also, should the lock->slock load not use READ_ONCE() ?

Yeah, good point. Maybe I'll drop it from this series, doesn't really=20
belong I just saw the cleanup and didn't want to forget it.

We we just ordering the two loads in this function, and !SMP isn't a=20
concern (i.e., no issues of !SMP guest on SMP HV), but yeah fixing
the lack of comment is warranted, thanks.

Thanks,
Nick
