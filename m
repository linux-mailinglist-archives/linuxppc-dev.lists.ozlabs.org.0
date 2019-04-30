Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B2EED5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 04:48:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tQvJ6zwNzDqLk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 12:48:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kpvZIF17"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tQsR4rV7zDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 12:46:51 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id l2so3253551plt.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=ZpJQsgca0/LVXSQJRGMNekhujVFwpXEhIaVfT5sfHAQ=;
 b=kpvZIF17L9G03YJq6KG5vubutPEqXMbRlH2u3ftH+O+AKf2OGcWUdaTlOlazuQl36C
 T3YXt2hVzvcuh99ojGDB+1JXLF5u3RMsWoFk8UK3vWKWLRxhP85QZ7kQvaxE4q94m60X
 44wOHbQ63X6mjvJxlsky7M9GOFR4Tig1feUjYeiVoPj9F7gOx8xSGLksb14lXxnn7HsF
 qk6HxsKulWIihT8kN9ZUDmrDJRGFsrutS08zYZkGoTRuNDGSvzb1jhQCsuLv21wgUENE
 i1LLb6rNnKp3tPGoQ9XSv5thHAWIJe290G7aDuUqHbmu7BQTTrkG0YQwSxZlYAZ22wXj
 JksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=ZpJQsgca0/LVXSQJRGMNekhujVFwpXEhIaVfT5sfHAQ=;
 b=X8i5GzCnWRt3rKnY6YNwCXPyM2oAs52MGvnENUEtiW+iV0U137Vq94Ir6V3b6pU9GZ
 TQtMRb4cu9oy8Aw0aaUSBPdBILD5K3g08L/tL1xdJeAwRiT06q4VYu2KeicBrNFYZLR9
 BSTgrw9BYa82ToBaZSBa8C4+qk/ax7Xco+aP1cITZLIj7lTbmi38TIzbh7z9jRWaQ/dB
 V4lfWIrcwaISQydD4GhHDfIcbsZuwEb54VZL7wDCuC+FbFi7ZpFLKl11s4l009j0RyhC
 W+dFOfgqY2t7uEFWJstC9O6ycRsVcUvwGqKtcXIuVhjDOtKxVS9cGJkNyKHHMx0RJUdp
 7EJw==
X-Gm-Message-State: APjAAAWQu813buqUiwpoR2z9VwLezGK6CEtHg3+DOZ5V1ghcM76UXDWb
 4AJGJaozLyw33dA8yCcw2xY=
X-Google-Smtp-Source: APXvYqxJ3bN9p+xxhe52PIxCipNM8t93ISXM/JyGKmdLl5vcETLdScqbbeuA8ScDP+AwIhXCzD2n9w==
X-Received: by 2002:a17:902:8c85:: with SMTP id
 t5mr7315616plo.23.1556592408950; 
 Mon, 29 Apr 2019 19:46:48 -0700 (PDT)
Received: from localhost (60-240-193-213.tpgi.com.au. [60.240.193.213])
 by smtp.gmail.com with ESMTPSA id 17sm66294013pfw.65.2019.04.29.19.46.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 19:46:46 -0700 (PDT)
Date: Tue, 30 Apr 2019 12:46:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/5] Allow CPU0 to be nohz full
To: Peter Zijlstra <peterz@infradead.org>
References: <20190411033448.20842-1-npiggin@gmail.com>
 <20190425120427.GS4038@hirez.programming.kicks-ass.net>
In-Reply-To: <20190425120427.GS4038@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1556592099.38esq4uhhz.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-arch@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra's on April 25, 2019 10:04 pm:
> On Thu, Apr 11, 2019 at 01:34:43PM +1000, Nicholas Piggin wrote:
>> Since last time, I added a compile time option to opt-out of this
>> if the platform does not support suspend on non-zero, and tried to
>> improve legibility of changelogs and explain the justification
>> better.
>>=20
>> I have been testing this on powerpc/pseries and it seems to work
>> fine (the firmware call to suspend can be called on any CPU and
>> resumes where it left off), but not included here because the
>> code has some bitrot unrelated to this series which I hacked to
>> fix. I will discuss it and either send an acked patch to go with
>> this series if it is small, or fix it in powerpc tree.
>>=20
>=20
> Rafael, Frederic, any comments?
>=20

Sorry to ping again, I guess people are probably busy after vacation.
Any chance we could get this in next merge window? Peter are you okay
with the config option as it is, then we can look at adapting it to
what x86 needs as a follow up (e.g., allow nohz CPU0 for
cpu0_hotpluggable case)?

Thanks,
Nick

=
