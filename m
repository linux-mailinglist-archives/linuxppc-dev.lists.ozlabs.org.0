Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74E3F366A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 00:27:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grx8r2BY1z3cWZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 08:27:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Remefsbk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Remefsbk; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grx875kBnz301N
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 08:27:03 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so10097542pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 15:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=muCZGHGXDtZhLnuzxIVauvI9vXUTWXNUIrBwCRdMVco=;
 b=RemefsbkLF0qjalfgS/QPFy+s0vrHUCCRwLs5Nng2oRX7YN+RbFWFDzyRbXDUTFeRe
 ZcR6b656WMkKHvh5XwIeexMOkIK6TBTyMgP20QtOJD1jsJYkiBEWihN2CVwUcoknSiZc
 kfCOTeIeF9ja69Sxfpo9Tze/gbXlfbWjwwnjO1rkWyU9/APS4tY7lkRghKHUYYvwXaoY
 XjV//yV1jErHSoGWkaqeUNTbYjSMDPGF7Bsh5VYUZeLtO3D4NwU7djoZEoOgIYKcigrl
 LaQ3UiKuwPAupo+Ikjg0jO22FUEuCmAC9TlZ9LlWOAqKDqGqdS7VTnu20IUdQ2TEEMfG
 3dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=muCZGHGXDtZhLnuzxIVauvI9vXUTWXNUIrBwCRdMVco=;
 b=ijgj5shcNoSQsAjCpK1P53d0hmYseh0kR/f2pRy/g9huro2uBSWNCHDJKM58GUCV1r
 g8hMr/UhxvmJZowY0AilYoXnXrisTRoEcVcuIkzwENgamMGS2on9nRU3fQPCxlybJLf8
 vWhdPepfiS2LEesFE45UIuyFhLxRUuuTV/0uTh4m1S3F2W/YMRY8cWd/biXapLAHQUUF
 VabeUNhY2OiMkZSpFIhg70fFthuaxlse2JQe0bBXSWl8kouJujv204dXR9cHamMxl7La
 w+2Wg/aY4koqRqa5/AqklViqJx0jhu+KqGIzw8AmZvwuLTbZ5Fu3Q3lJGwXYwVTSXAfj
 xPfA==
X-Gm-Message-State: AOAM532YAh7UKixkRj0x5OS5yc64YFCo2inJ7a9B1YDlGo/175YIy7YD
 ZB7pQF80BX3O65LHeORo4LSswA==
X-Google-Smtp-Source: ABdhPJxsP8i0TWeDLg6wsQ9UPwVK0/yOGsDuiZiCVZBbzrivtJSRk9eK8LYUFD9Zq4FE5g5ke2YZTA==
X-Received: by 2002:a17:902:7c15:b029:12c:78ec:bb61 with SMTP id
 x21-20020a1709027c15b029012c78ecbb61mr18323457pll.61.1629498419309; 
 Fri, 20 Aug 2021 15:26:59 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id s1sm4169427pfd.13.2021.08.20.15.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 15:26:58 -0700 (PDT)
Date: Fri, 20 Aug 2021 22:26:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME
 on xfer to KVM guest
Message-ID: <YSAsLShyWK3xgxse@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
 <YR7tzZ98XC6OV2vu@google.com>
 <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
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
Cc: KVM list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390 <linux-s390@vger.kernel.org>,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mips <linux-mips@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 paulmck <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 20, 2021, Mathieu Desnoyers wrote:
> Without the lazy clear scheme, a rseq c.s. would look like:
> 
>  *                     init(rseq_cs)
>  *                     cpu = TLS->rseq::cpu_id_start
>  *   [1]               TLS->rseq::rseq_cs = rseq_cs
>  *   [start_ip]        ----------------------------
>  *   [2]               if (cpu != TLS->rseq::cpu_id)
>  *                             goto abort_ip;
>  *   [3]               <last_instruction_in_cs>
>  *   [post_commit_ip]  ----------------------------
>  *   [4]               TLS->rseq::rseq_cs = NULL
> 
> But as a fast-path optimization, [4] is not entirely needed because the rseq_cs
> descriptor contains information about the instruction pointer range of the critical
> section. Therefore, userspace can omit [4], but if the kernel never clears it, it
> means that it will have to re-read the rseq_cs descriptor's content each time it
> needs to check it to confirm that it is not nested over a rseq c.s..
> 
> So making the kernel lazily clear the rseq_cs pointer is just an optimization which
> ensures that the kernel won't do useless work the next time it needs to check
> rseq_cs, given that it has already validated that the userspace code is currently
> not within the rseq c.s. currently advertised by the rseq_cs field.

Thanks for the explanation, much appreciated!
