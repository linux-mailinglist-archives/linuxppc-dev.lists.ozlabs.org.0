Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D754B8AAFE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 15:58:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DuHVRzYi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLbpj52FTz3dD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 23:58:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DuHVRzYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3chgizgykdcmrd9mibfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLbny6q9Bz3cPh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 23:58:13 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de468af2b73so3536036276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713535088; x=1714139888; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgrnEQ6mmP0jFk5Zb1SZY9boKJybsIIVble8n571sqI=;
        b=DuHVRzYiOW23zTL7IpDcG/NB5pqJsYSOVMtoCGnp+UMf8FCGd2xzI4/kxO6OJtgu9N
         yEJbHywi1oohdVm0WTf/AUm3F3+Vw22bhVxlrrc33lnohl6RoW9OrbdKA05TYdjkeOmY
         QelhmP8zxmxsMAByxLC6y31UzO/5blS+xynLzc4oXGfpLuMPpb3MA7xGeFx4jzvtN7co
         b9wvJVuTpU5of17gFtiyB2b/eWzi3ZvtiYQAWjnKFjn7T1CEHqPIBTsMYxUTaO+yngRi
         5HlQvc3C/CMt88DVVzy2UkXUJTx5Xs7FGjCasH+foTWsaGGP8QbxsXdPtyIeoyGToXzq
         chew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535088; x=1714139888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgrnEQ6mmP0jFk5Zb1SZY9boKJybsIIVble8n571sqI=;
        b=VhCpQ/8zD79QNYUyKMOWa/8ZjzE+JTrtLSCIZR/v7ixPIq5xVt+IdLLBQOhjRaQrGZ
         ax2UACs7CcsKW6IzDtNfoGpZMp69sIgpgw05T9w2bowTdNEKRfvmv2q1U3qbna0V7epc
         Y40lgtnZ1gNMYZ0USOdat/VnNVZqg3RYqCj5fkxV1MsSgq6AcazXpTbVau1Iv9N7ubUA
         szc6/5LHM7Y8QuC1Ti5pe8o+7r7ejQzh1tD0K/nvtCStM8zuCKsZtaBuKuirgZzq8Dva
         vJYwrwYoitgWqgGc8n8BAT8MvKe2FCpywxZSCPOFyQQhcN7nT9bFQ1rvDrhX28jSs7xK
         97fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+JArCindkxoR0xSZ57/DfIddWxvOoVkJFDseWvNRWf0l3CpDJbznjMOX0F4WPzvFBQZVyeo8cApjUhyo9LwRc0WUZgsslMTicsVJzmA==
X-Gm-Message-State: AOJu0YziDUVv06dwbEcPBAe+W+u95Xa0/UPsANlOzjfEvifZ/CkS4yQN
	RIm8cz+Wea8dBVpwsFGRfFdQjOZTS3g4hkEl/t2F6nqNL4DkU5ndbwOqUMLh2XWRNI8r1TJ/hKE
	wOA==
X-Google-Smtp-Source: AGHT+IGomtDJcb51lvQMFTT5YaGoxW/vZTzkUSuhiTLoa8vZxcxiKEVXH4dmB1G1pZ9i7NSp+ryn6A1areA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ad8d:0:b0:dc6:e5d3:5f03 with SMTP id
 z13-20020a25ad8d000000b00dc6e5d35f03mr543024ybi.4.1713535088599; Fri, 19 Apr
 2024 06:58:08 -0700 (PDT)
Date: Fri, 19 Apr 2024 06:58:06 -0700
In-Reply-To: <20240419112432.GB2972@willie-the-truck>
Mime-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com> <20240418141932.GA1855@willie-the-truck>
 <ZiF6NgGYLSsPNEOg@google.com> <20240419112432.GB2972@willie-the-truck>
Message-ID: <ZiJ4bqrBUPM0E8iq@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Marc Zyngier <maz@kernel.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024, Will Deacon wrote:
> > @@ -663,10 +669,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  					break;
> >  			}
> >  			r.ret |= range->handler(kvm, &gfn_range);
> > +
> > +		       /*
> > +			* Use a precise gfn-based TLB flush when possible, as
> > +			* most mmu_notifier events affect a small-ish range.
> > +			* Fall back to a full TLB flush if the gfn-based flush
> > +			* fails, and don't bother trying the gfn-based flush
> > +			* if a full flush is already pending.
> > +			*/
> > +		       if (range->flush_on_ret && !need_flush && r.ret &&
> > +			   kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start,
> > +							    gfn_range.end - gfn_range.start + 1))
> 
> What's that '+ 1' needed for here?

 (a) To see if you're paying attention.
 (b) Because more is always better.
 (c) Because math is hard.
 (d) Because I haven't tested this.
 (e) Both (c) and (d).
