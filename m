Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85A14AFE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 07:38:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486H516RbBzDqG6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 17:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::f42; helo=mail-qv1-xf42.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=dX5ri6JW; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486H316MJVzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 17:37:01 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id p2so5746221qvo.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 22:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=0abVuQRiEoEWLaCFKSSRqYpNWOPktE+d1wvOzU3Y5QQ=;
 b=dX5ri6JWeqf2OD9HUY9VaB/KwNs/qrzPVG/Mkk6o9PIOqw2H/gbYXWgmg5n/T9sQZi
 Iu9x9L3POLnl1YchVinwocuu9ounpYF8/kx5Kl6xkZvkINd+J3VgmAAsMM4XdNmOQpGF
 n/A6miYs2pl1z68bmOVHF16tPK0qb+EWBTpkY/wDARN4JMfLDfXWnSNw6qljowznZeLw
 nC2mDCu/xZdzLMzffrfLowRJu9L4pvo4bnAdA6EAug7bCreb8yqSCB9NBnvi8MDOIkJC
 NhZM5PfIKH0yrTiGcHzwETXhAcZRM4FxAKgtCYb9TW9qoZDA0+sfnlblbnN56jONvpa4
 1ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=0abVuQRiEoEWLaCFKSSRqYpNWOPktE+d1wvOzU3Y5QQ=;
 b=R/1QkDwftizkF6Ctc5Dqrwc23PBxx2RAUjNSeqvSyuAfav9NBGtao+RJDxS8drISU8
 PsRiw8fSkgBXdN5wpfnmWipT71LXUJ4rHlSozeIitKF6+9/37F5Mn06u86tevS45PbvG
 rZhAZjXoZ2j/2HxWuoDVmPmbr1wVLZyIqqWAnu+O7M1Rh2So+EY52O77jBWljt1eRN7f
 dLqyXmFn/gcqvcX7xbqiOOxouOhBUUtz3UHc2OhgUeCXP69PmkXsRrDWwiA7gIAmfuOb
 E3oJdRUVCaCzzBZe9HyPty1xGj15L0e+5nQR/Xp/HohNI4tkK/8lI5ukdxPTpOLEEFwV
 VSjA==
X-Gm-Message-State: APjAAAXbPV8j+Y2jKihH1RCn3HyX6cdflM0dEvoAM3jNe0MykcjKdfSV
 tCwY8u6jI04RvDTvVT7aeBEm7Q==
X-Google-Smtp-Source: APXvYqyOYFD97tfKGnmPwPmfp2w3pbVQzr1Mc0RjmsOaGaxOYR1oH4beASJJ2LsvEzXBpFE4wXV4hg==
X-Received: by 2002:a05:6214:1189:: with SMTP id
 t9mr20389607qvv.153.1580193418367; 
 Mon, 27 Jan 2020 22:36:58 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id z126sm11703882qka.34.2020.01.27.22.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 22:36:57 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 01:36:56 -0500
Message-Id: <F90DA0AA-4D27-4346-8D8D-D9A7871E2C07@lca.pw>
References: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
In-Reply-To: <115c187b-73ce-30b2-0694-999db1f2183b@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 28, 2020, at 1:17 AM, Christophe Leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> It is 'default y' so there is no much risk that it is forgotten, at least a=
ll test suites run with 'allyes_defconfig' will trigger the test, so I think=
 it is really a good feature.

This thing depends on DEBUG_VM which I don=E2=80=99t see it is selected by a=
ny defconfig. Am I missing anything?=
