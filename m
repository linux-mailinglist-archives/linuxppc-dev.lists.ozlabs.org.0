Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C91847815A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 01:04:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EVGfgwe5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSHWQ4zX9z3cRt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 09:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EVGfgwe5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3zvjfzaykdg0dplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSHVV1j8fz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 09:03:46 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-589b0bbc290so18815537b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692399822; x=1693004622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=28NglzIO6cp/vzLfU4W3yc26zb3SzMF2NIoeJVJxjcQ=;
        b=EVGfgwe5loZZR0WMUgpJEOZteslGNWIqlIRhDe/gbts+F4/yw7LopoWIr9pAXN/gct
         vmDVXSSz1qYQsgmOG56EVjufIZ8uHJIc0K2fjYh54YGOjsi7Y2c13ZQR7k+mneDCdJ6K
         fzW5DxeEtavJtj3e3uV6c2SWgwD/YmEbj2Rv9dwQ6wRuQzmdnahyzKBwtcnM92PUpCV2
         6SViYhyQd8PzIgA5SnclKlRnW0JgjAUS06yCK7QyV0vkFW6Zt0VuYiJbLr9XMzWwR30M
         Wq85gyIx9s0/FGvGJHcq/Jks4zP9GUvni76QMTBxGvpnvPGwvzqq5FqhBNo14dUbWrMQ
         g0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692399822; x=1693004622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28NglzIO6cp/vzLfU4W3yc26zb3SzMF2NIoeJVJxjcQ=;
        b=TA6aTH3x72O3y2+dQfh0WTGMBlktCnQAlNH0VLZ+METeZwAOYWwhvVRsM4Nv6ktXuA
         lMoa2FRvx/lVPJn7Bu5Z4CMPbvxXlyjPrmE/7lv4Ejyyft0IO4DiaxuYmtCfwZpyGrhy
         ZWMzPU6ghAlBdU5jO8QUk36gsTh8XoJmC4LtwgQCpE8RvcXV04h52RwN3rh+G92hecT/
         MP1vYaA3Qo224JTVPrZJBdD2ooDEM020lnk7Hj8sovFRdWpg+GLjeKQsnE1+5c3VOtBF
         iDpt+jpbMkQqUhy+y5NPecCCnln9+5OC4+SjUwFUU120GAqtRfmLnGP8aY9iF2EHXInG
         Abug==
X-Gm-Message-State: AOJu0Yx80gMEPqSaJN0mz71mmfraOczzEXqOBH+ncvlHIqFNg2S9yuRz
	HFfwr6o4dGiNEEsvtrSNdBNu4QEhYIE=
X-Google-Smtp-Source: AGHT+IEiW/RghuqZOFRro09VfZa9EIt3/32aXeBy5eI/raBp2zbRsudvcD77PZeJQ//x65k1pSmrq3qMqqs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d149:0:b0:d4c:2a34:aeab with SMTP id
 i70-20020a25d149000000b00d4c2a34aeabmr6800ybg.11.1692399822583; Fri, 18 Aug
 2023 16:03:42 -0700 (PDT)
Date: Fri, 18 Aug 2023 16:03:41 -0700
In-Reply-To: <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <20230718234512.1690985-29-seanjc@google.com> <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZN/4zZFrsPdh/mLo@google.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
> > +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
> 
> This should be
> 
> TEST_ASSERT(ret, "fallocate beginning after total_size should fail");

Roger that, I'll push a fixup commit directly to kvm-x86/guest_memfd.  Thanks!
