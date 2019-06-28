Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A37555948C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 09:03:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnmC0VNBzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 17:03:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0nBNKPl"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZnkW1YxWzDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 17:01:54 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c14so2723093plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 00:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Oej4Il0Mb4EFBZMtlZZn5pX80rvSmbWkyqLWJge1d2k=;
 b=L0nBNKPlIlQRaPgZW8NPCGfKolxLNRUS50MpuU1bGXBabvPyJ3Mz5hRD/k76+mno5m
 SH8fndCLLAjnbIYegvNVs6uFK1m2r+C9h4WprcRraHhb5YOcDOEQurasElg0F7Mjl1Ll
 BOMwQsGJ3h6xvjSbhZ3X0S1kQSzZORXEDmlwVhBUFV66u6zzFwJboR8NkmswnzWZB6gX
 Uyo36sqMhSEcKDYu98NdsvvA8+XO3ORJZyLOE8GokAt6AvGeUxer4bknEjBm0X6YvOxm
 N05VWKTbRnCL48tEMSifhCNYv3MlPeyD0Gq6fpg8QpUKb8KklPhBRoELPDN1mx9TGfpL
 uVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Oej4Il0Mb4EFBZMtlZZn5pX80rvSmbWkyqLWJge1d2k=;
 b=KlF0oJZcDaGcuvayeZ7OvUm+5gKUa5zUsFqhn0g5FXW6BKFprS9zwvhH1I3FhekAO6
 E3/P33yxqZz1WMudbqu8Qbonv0C2+YHi4M7Olt1UViXEFG6UvPqaefeBCsxJu79WurA3
 OWwE3bezXjcj/Z8C6tjFjaWyeUQg29XIThxn+W8E2SlnzutjKYgClM9bzifYNz1gshWz
 yW6gjT4D9l4C9zCb603Id+yW7lUb0hLl1KaEErRul6lATUYfJ0F5gND2KtFCQt0QhBGO
 bbOcVJNKBIULxHfK3ro4PsPkjiteuyPuSvBvnKduv78oZt9mplH+rz2uHIb5dJfMwlX7
 KTfg==
X-Gm-Message-State: APjAAAWQyotqs+LNQqPHskfsjX6OEzTaH1OuxqsAeHRAOnRfnxTbPWYv
 PgU47MBUhvtcrnMRfIhBnZU=
X-Google-Smtp-Source: APXvYqwanWf3ASBp72KqH/U1FXF/IN4IimSrhXCm/tnJ9qfR5cPx0y2Rd8fi6o7KB62zMjGhVN4dkg==
X-Received: by 2002:a17:902:28e9:: with SMTP id
 f96mr9289889plb.114.1561705312662; 
 Fri, 28 Jun 2019 00:01:52 -0700 (PDT)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b29sm2333297pfr.159.2019.06.28.00.01.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 00:01:52 -0700 (PDT)
Date: Fri, 28 Jun 2019 17:01:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/7] powerpc/ftrace: Additionally nop out the preceding
 mflr with -mprofile-kernel
To: Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <841386feda429a1f0d4b7442c3ede1ed91466f92.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <841386feda429a1f0d4b7442c3ede1ed91466f92.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561704544.gobmve95sq.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao's on June 27, 2019 9:23 pm:
> With -mprofile-kernel, gcc emits 'mflr r0', followed by 'bl _mcount' to
> enable function tracing and profiling. So far, with dynamic ftrace, we
> used to only patch out the branch to _mcount(). However, mflr is
> executed by the branch unit that can only execute one per cycle on
> POWER9 and shared with branches, so it would be nice to avoid it where
> possible.
>=20
> We cannot simply nop out the mflr either. When enabling function
> tracing, there can be a race if tracing is enabled when some thread was
> interrupted after executing a nop'ed out mflr. In this case, the thread
> would execute the now-patched-in branch to _mcount() without having
> executed the preceding mflr.
>=20
> To solve this, we now enable function tracing in 2 steps: patch in the
> mflr instruction, use 'smp_call_function(isync);
> synchronize_rcu_tasks()' to ensure all existing threads make progress,
> and then patch in the branch to _mcount(). We override
> ftrace_replace_code() with a powerpc64 variant for this purpose.

I think this seems like a reasonable sequence that will work on our
hardware, although technically outside the ISA as specified maybe
we should add a feature bit or at least comment for it.

It would be kind of nice to not put this stuff directly in the=20
ftrace code, but rather in the function patching subsystem.

I think it would be too expensive to just make a runtime variant of
patch_instruction that always does the SMP isync, but possibly a
patch_instruction_sync() or something that we say ensures no
processor is running code that has been patched away.

Thanks,
Nick

=
