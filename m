Return-Path: <linuxppc-dev+bounces-10335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC5B0BF79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 10:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blvQ60tPLz2xKd;
	Mon, 21 Jul 2025 18:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753088174;
	cv=none; b=KsozoQ4cDtYhLX5/RCvGFP9YIsxwTxus+3duU6dynpVqVqARJ0tXtgk42rdm/DUzqEsy/7MreZjtTG+0FIrfsrahI4qa1xnHcZuELy/t43ydsdf7beDBAOaFjiVo8jlvfI7Mj4fuKWCXk/TvUP99U4gSA50dYhUTBQ/SLfB+3Hq6eWoPGsskYs2OsTXmMB3mg5YGOb4LjC+y/6b+/fbDq7o3nBYpUEU3sYgj1yPsmIn3W2Jxqkfj3u0e3qq5hjHhkkmMzI+aCYy8Dyp0l4zzrM0VrTTfOdNxRxgniKQxQj/FTnKTwLR5YFpLEvnHyVrva/PbrYUK3SV5/6TMBKLm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753088174; c=relaxed/relaxed;
	bh=7a+mMHsMlXSHJfvHPELmbgN6W6iJdxKKlOu5d6bzUb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bvwlo5QzJ6sSpphwrh+R33P1uFa+q7tFMHV76qC2hFKH2GPrC1tupUs3tgC5XcC4ReOkfAJ4q5Zi9299fc8x0sTLZC86h/D+7rTHi/IfEVbsWYd8YJahLvxfdbtHVxERpSweIRnKwAf350QAjIRc7ALp7uYB0wj4gpncaWuuRdqoOVuE63DNfvTw9mrw+rlhq7bsJuUX6vNA//4K7RqiB0kYqaaRd1w9NYwft/c1oQ/0BPd0UiQYLPDEndPdiAok+SSvXXahhPKiOheSnfdD669hvqFQBsyVhoihKXcDN0NDZlE3rXmJcjblXA3xLeDypG6+QZhGostUiHGR3pD72Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.48; helo=mail-ed1-f48.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.48; helo=mail-ed1-f48.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blvQ42bhzz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 18:56:11 +1000 (AEST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso7351492a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 01:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088167; x=1753692967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7a+mMHsMlXSHJfvHPELmbgN6W6iJdxKKlOu5d6bzUb0=;
        b=KQesxXq/4xj5xqyy0UqyftkjNCsJTfxH//37kpCEkJlsXfCwbO76vxwu90zmOZ5sgp
         yR70aDBFDVI9hAtzXxP6fS+XOyDd5fCXlfZgH3KmXF7R2NRHhkVvIVxGlOmltjaGtG6F
         eoudWZohPP7QDmVYXAtB2VU/uHBj9m/ddQteb/80lEs+kpl9g+fjOsaVUA3ntXzeF4LP
         jCsqGFkD4LEvmlXa72x4zAYo2VT/IRh/ljTRLJRHI3ZlhkgOM1UFJaZAdOkPw1T8GrM2
         J4TcQ7Dkkn8Ly4nCVtB0bAUCjuP2gYdJgiJ2c8q2lSyi1EdXd4KAHshIQEEF0qmRdbtI
         FO8A==
X-Forwarded-Encrypted: i=1; AJvYcCUAB938ENRYPI7vM9BJKOpf/pE3kxCfHzcanXEVtXZGKb/4Hnj0WmQoBsskC/PThWyVfgv0DL2R8M4aVHU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzttpyipZMoAny18gCzrcbrTE0pKgvgFdqEuyJlX360nHS9Loco
	ABVPA0/EpRk+RVRJn0jzUMocC+CmuHKn47XKvZZdxEHo7JSAImlVwzat
X-Gm-Gg: ASbGncuX0C6LbsDmI4JIrnI7UZ95arK+XyXD8Tl8FWIz7kbiTmzbnsN/WbSQOZbPbCg
	Za6e4cL9Hu7ejS/phL6CnZFswXvtQLBl/5EngU0Lypqmsiy54wJ35OJFpi+iV7Gue2D0XF2Kmpn
	+u63NDBjfQeLeMhUViXpRqXYlFTpwdMbxo7o0VeMMDubn1g2dd8d4Jm14PmD/C7cDnxolYDr7zP
	b5PcZIgS//aqKE/6D5zRVavc7pjicADRgwfYBM4hI+vMcWEcz4YPt4Q6yxrnpzo3s6Oe0gfOATh
	MlnUVtmZRFOTQHkfmlDLZSSCPSy8ifBXm2eKzXp2CJxj10ZQuAebAZJQ9WjXIgUT3JTiGKYBpVo
	amrLpjwWQVfQSlQ==
X-Google-Smtp-Source: AGHT+IEO4SybCFLnv0FdYsHmbgrbP3TZ+2cOjGcDGUgtwCXqHHCS19zQvONNtXYlZVgWK8Y/lPeVZg==
X-Received: by 2002:a17:906:8c2:b0:ae3:f3c1:a5dd with SMTP id a640c23a62f3a-aec4fca259amr1202375766b.61.1753088166300;
        Mon, 21 Jul 2025 01:56:06 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79e16esm636036866b.15.2025.07.21.01.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:56:05 -0700 (PDT)
Date: Mon, 21 Jul 2025 01:56:03 -0700
From: Breno Leitao <leitao@debian.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>, 
	"mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "oohall@gmail.com" <oohall@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	"Moore, Robert" <robert.moore@intel.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>, 
	"kernel-team@meta.com" <kernel-team@meta.com>, "osandov@osandov.com" <osandov@osandov.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] ghes: Track number of recovered hardware errors
Message-ID: <yk7ocbvfb7hswfdi2bft6lkatonn2ulu34kz44hypjwdagzeos@g6lmdncwrqhl>
References: <20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org>
 <20250714171040.GOaHU6EKH2xxSZFnZd@fat_crate.local>
 <SJ1PR11MB6083C38E6DA922E05E1748D6FC54A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20250714173556.GQaHU__LL6IUIPCDIW@fat_crate.local>
 <aHWC-J851eaHa_Au@agluck-desk3>
 <kw7mwmca3ir4nfyofumqiack5sht3aisdchevykdtmlio6xo7z@5xbdibpqvqix>
 <SJ1PR11MB6083CEAB23FCE85937DC5403FC51A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <mazejvrglvtqdfsevduahqxvlvjv6hlo3apivossn2jnxpsuds@os6kxmmsq3xt>
 <SJ1PR11MB6083D08A2F94FAEE5261AA6CFC50A@SJ1PR11MB6083.namprd11.prod.outlook.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083D08A2F94FAEE5261AA6CFC50A@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Tony,

On Fri, Jul 18, 2025 at 05:36:50PM +0000, Luck, Tony wrote:
> > I found that I don't need to expose the metrics in vmcore info at all to
> > be able to read them from vmcore, given crash/drgn can read those
> > symbols.
> >
> > Global variable hwerror_tracking will be write-only during kernel
> > run-time, and only read during post morten analyzes. I am still not sure
> > if the compiler might not get rid of them completely, given no on reads.
> > I am wondering if I should EXPORT_SYMBOL_GPL(hwerror_tracking) to avoid
> > any optimization there.
> 
> Thanks for fleshing this out into a patch. It looks very much like I
> imagined.
> 
> I'd be amazed if a compiler did elide all this code and data because it
> noticed it was written but never read.
> 
> Is the spinlock when logging really helping anything? You weren't
> worried about locking/atomics in your original patch because users
> mostly care about zero vs. non-zero (or maybe vs. "many"). If the
> count is slightly off when many logs happen, it may not matter.
> 
> The spinlock doesn't help with the timestamp part at all.

Agree, precise number is not important there, and if there are
conflicts, it will not hurt the message.

Let me remove the spinlock completely them and send a new version.

Thanks for your support,
--breno

