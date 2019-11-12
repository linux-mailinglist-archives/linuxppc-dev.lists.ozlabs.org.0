Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63069F8896
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 07:32:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByZv3zKXzF5DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 17:32:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=mingo.kernel.org@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CmNQS9o0"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByXW0HzwzF3V9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:59 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id i12so10233888wro.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lAYMmo1eJk0nu5Pp/QFztO4nECppTXXyiwDmyLApAMU=;
 b=CmNQS9o057m02iB3aVZCvD9IKuX8qvcKJgJUgyo4KExtj2bJGSViNfCsIbt5SiuwMO
 vuoCblpkhQtIhImySY2l9xgcSalma2cLx/gmbDWtxOG+KeWeZqQREyCEiZtz2MaeiTEY
 RldTTXX6x5mGp2gTJOMJKKnH3ErtuhTGJVb/oxnV4qflBhEKc0iGhFu9X9Z6Ewwj/nv7
 RJ+bk94WWdoFyERGDm1828mxsXI6cvzgXYdmifbVY3rPGuNlfG2Jz7tz9D0yBEL7amvI
 N9XaeSRhLvOl3rh+bmOKbDc4uYMU01us4xdrDKX0UOdp1yr6ys5I9p7y6gCnhALJgHcw
 WXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lAYMmo1eJk0nu5Pp/QFztO4nECppTXXyiwDmyLApAMU=;
 b=uMTU3AAevuks4VxAVxGbIVJLO6G4DGv6Wv9TysyI67cvHn1XdpH4dunAFN5Y4x8zDt
 b2QiDxsru/uaRLurzVYDPmsjGK/bvM/xnP5motVEE9NQKRP8To69AK3BVkihNT/UiNjn
 pi3LkdHAow4FtDwbNlAEdtE4fR+yAXTAvS0Dvs5k4qyf0RUz1svpBH0hRAthChpaNN0n
 3pUeHlmSoQ9DJCpWSH1YISeBzsLiomHYNLO3Hps7CCaYNS0zdUsy5S32qvZcIW0gpWG4
 MSFLfAV1+sNtEGv1FJrEKwRk8zlU9em3Wz64q6gTRNXO+21ki7wMoNWUjRrLxMWP/HVl
 RbbA==
X-Gm-Message-State: APjAAAVp1uZ5QDEUoGRx6Q6k+oLw7byivPG79YIIVkw3vva/RjJ1Wmyk
 9DAf232noWhH4Wb9RHza6a4=
X-Google-Smtp-Source: APXvYqwg7II6op5rkcQCA+kVGqp8JW9qmm3wOv2otknPBBGlW4hCTPNNQNQ0ueZUnows/DjxDY46Ng==
X-Received: by 2002:adf:ab4c:: with SMTP id r12mr23079230wrc.3.1573540195668; 
 Mon, 11 Nov 2019 22:29:55 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id 19sm40418570wrc.47.2019.11.11.22.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:54 -0800 (PST)
Date: Tue, 12 Nov 2019 07:29:51 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V9] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20191112062951.GA100264@gmail.com>
References: <1573532326-24084-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573532326-24084-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> +config DEBUG_VM_PGTABLE
> +	bool "Debug arch page table for semantics compliance"
> +	depends on MMU
> +	depends on DEBUG_VM
> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE
> +	help
> +	  This option provides a debug method which can be used to test
> +	  architecture page table helper functions on various platforms in
> +	  verifying if they comply with expected generic MM semantics. This
> +	  will help architecture code in making sure that any changes or
> +	  new additions of these helpers still conform to expected
> +	  semantics of the generic MM.
> +
> +	  If unsure, say N.

Since CONFIG_DEBUG_VM is generally disabled in distro kernel packages, 
why not make this 'default y' to maximize testing coverage? The code size 
increase should be minimal, and DEBUG_VM increases size anyway.

Other than that this looks good to me:

  Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
