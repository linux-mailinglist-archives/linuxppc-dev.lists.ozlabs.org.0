Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FC10A626
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 22:46:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MyCk6dN5zDqdd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 08:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eDw8REuP"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47My9Y6Wg8zDqlJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 08:44:49 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id u18so4866697wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3TCvikHiROllDrcma+CvPeIZvgOAa0DLqL9aOfiW+v0=;
 b=eDw8REuPwOPqWU2sJ0BdoRVPWKUzTj0YbRhRQicf7aRtg+PGgtxw8sQrt+ehKPldab
 5Dwy2fhc9u1vkpmctrriVLMl8oM14lEykl7FUpFaq7z8DZyPiTAQ15aQY/539wKteIsr
 PisqlDWBEUmELtSDpWswAvRPvWzb8PxcFGyB2YSldaUc/KJNZJ5xSrFXBExtlQZTtnbi
 yVA2wl3bFw8rtMJHYIgKpbAr6viP0/SLeXLVyjJVpba+oUcFvxhU8axe3RmrwZPRAH1E
 jeSYxPlmbTqb3sH23BN2jiUb/FCQyeEIIuvJJsNlYeo/G+mKIf/K+yryI7MdWHcPfB6w
 86kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3TCvikHiROllDrcma+CvPeIZvgOAa0DLqL9aOfiW+v0=;
 b=tPfPP4VCsyBxzSxcPtBYwlGlZksF/A+0j0SKgdamIOPSxi0jIIVeftZN8uiGPR8kpA
 /j1Sx1oqHxuePvzYhuZVVTTdyKidoZR9jkGwAYWfatad03Y6M2J+laM/l+CNIQHwSCMH
 I4IAHL6Ihj3qMTnUN357+/udEANIkssca1sxgEga6kZn3kcwFTBrXTJEKZNlO3MOYSEl
 iFCa2AcpFVknd4tmTvUXjqdr/FySU6cBt8ZzHKXm+bQFYPPRCQYFOu1sM9Kupgih7pYF
 8ziaeuO3z8iqypdvcgmIcbTwpzhRdy5CiJppm1UY6jjlJhN5EkNTX7gmyWLMpJItEMGF
 eAgg==
X-Gm-Message-State: APjAAAXrrtymKRNvvhkhq9InayRAejeKqgwTVccYOkTPLOi3v1K2HEa5
 FKWAr6HBHpGlGizznTe+Uds=
X-Google-Smtp-Source: APXvYqzKuSB3cAu0EuiMT+9vrB+n7dd0HVpAtyzd2Elni0TH64QZnLUu2tuPSqhTHT8AOVtai1OAWg==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr999955wmc.37.1574804683968;
 Tue, 26 Nov 2019 13:44:43 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
 by smtp.gmail.com with ESMTPSA id x10sm16353061wrp.58.2019.11.26.13.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 13:44:43 -0800 (PST)
Date: Tue, 26 Nov 2019 22:44:41 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v2 26/35] powerpc/64: system call: Fix sparse warning
 about missing declaration
Message-ID: <20191126214441.4wziibsax2mvpl3p@ltop.local>
References: <cover.1574798487.git.msuchanek@suse.de>
 <d0a6b5235c4e1544f4c253724a5b8f2106cc43bd.1574798487.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0a6b5235c4e1544f4c253724a5b8f2106cc43bd.1574798487.git.msuchanek@suse.de>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Christian Brauner <christian@brauner.io>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Diana Craciun <diana.craciun@nxp.com>,
 Firoz Khan <firoz.khan@linaro.org>, Dmitry Vyukov <dvyukov@google.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Jagadeesh Pagadala <jagdsh.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Daniel Axtens <dja@axtens.net>,
 Gustavo Romero <gromero@linux.ibm.com>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Brajeswar Ghosh <brajeswar.linux@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 09:13:40PM +0100, Michal Suchanek wrote:
> Sparse warns about missing declarations for these functions:
> 
> +arch/powerpc/kernel/syscall_64.c:108:23: warning: symbol 'syscall_exit_prepare' was not declared. Should it be static?
> +arch/powerpc/kernel/syscall_64.c:18:6: warning: symbol 'system_call_exception' was not declared. Should it be static?
> +arch/powerpc/kernel/syscall_64.c:200:23: warning: symbol 'interrupt_exit_user_prepare' was not declared. Should it be static?
> +arch/powerpc/kernel/syscall_64.c:288:23: warning: symbol 'interrupt_exit_kernel_prepare' was not declared. Should it be static?
> 
> Add declaration for them.

I'm fine with this patch but, just FYI, lately people seems to
prefer to add '__visible' to the function definition instead
of creating such header files.

Best regards,
-- Luc Van Oostenryck
