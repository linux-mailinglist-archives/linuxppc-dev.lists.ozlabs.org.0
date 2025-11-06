Return-Path: <linuxppc-dev+bounces-13892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F1C3CA7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 17:58:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2T186WzSz30MY;
	Fri,  7 Nov 2025 03:58:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762448332;
	cv=none; b=h2LrSrIECqAiqa5pgrrKNwL9I5EVbUAlbAS7bP0JNBbgpa6yMaN2fbSkv4uKM4d/dPel1vqBsBJnfGunsFxqpuJ5GxU36uhVmv22M+SsdQ5mq3tIJWy/o8kyUL7yE55skUFq/HBaK1wjS5Go4UlhwshVFPfPHTH37WxX8ZyN8AwTSVoSmaeUEMUE2A9+DcUUKte9lJUV4dxrceW+/T8SGxN75pbRmF36Rw8ICkqEXm7xALj0gx14yWGRjafUhzAbreXvkaS3NYKIQvuInwXLILBN0jjHOaircWVyXcl4YuhePtZ06i5N61OM7Q5ICxxGOGHDaSWQH7cTBLffdgCnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762448332; c=relaxed/relaxed;
	bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=jTOxnAhQMV6PNb+Hvn/BgeGB0bODaDAt4KW/1/HdTUfWIqAE92Qukz6iaj4jY4LIk7j04889PZ595uzpsBEU1vcXaCF01IQw1iMrcRrol2fwR9457csJAKLDVvUzJkKGNbd4KhcW3NTQliLxZWh2lcWe4yL2L0WGBzAukaequipfe07DejU4HH9aB3Q133k549kWcitBqIq77XwoBRBHbZAN6UyUX0xW/YHbRcmtSnqCst42TyvlxsgJXcgwy+JyL33ERuzopUjhuWQpWg0cXuR2JKHduSGpDMvJt9ZMWZmdrBU6G+Aw5ki/7vKdIqSpAotWW8qDVKs8sAdQyWl7qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSz4KfUD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gSz4KfUD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2T176Swsz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 03:58:51 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so1517644a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Nov 2025 08:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448329; x=1763053129; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
        b=gSz4KfUDBtdTt9DVU3dbIUqyLwWOFa+rIuBOHIp+dmw0wgTAlAH/mICq0b+ltk++By
         U6XxRu80nYxrzrUb/xLSctzKUSS1p+i3mN3u2886Hywe8gdQC8hHzHV3uXt9BH5LOx/j
         xSSAkhecq5NlwP88PBl3bdAe5vg4G9151ScGMt+XVXrp1QOpvg8FEJ9BSV4erNlNnwBH
         MYB0GZ5y/ALwRfJTVlRyGlMQG9n46L4I4ZDy1Ih5jWVfoM5z4W2rnWmKI8pa+sz21jy4
         rutVNGQ5KZx7ea7eWZBAkA5lvum/YTNSY/fnN+Pb0h2YkPbJGnQGDWfhEPCeLT7oi2bN
         Zd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448329; x=1763053129;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
        b=QJfAiVR3qBdiJ3aGeo3cdDvTKh+pnb5efj8qCt0YgPxVv/Il36gsD4rVtyRm6+B32g
         xFvInaL0hjV5/za2P6B30qIuE515z4vVNP+m30t2i8PtK5tio9i9/14pLHZdGb9KLytC
         xltJbSsgo8WruziqxGT+G9URQNHPAPadmtNzkcm2/5UdQl68sOChR/nrEqjulrs4dn7E
         tgViUedRvXu1ULdIWVpA3O+omn9ueoLAm1pthc3G778rMNaheGde2Nk7+O5qn0er9A+J
         AbP9+25JHQ+Q/MSeUpo8rb7fUts05n36gV/v3eOG20+QRdRisUe3yH2b0c6fev1nVj3a
         xi0A==
X-Forwarded-Encrypted: i=1; AJvYcCWfz0mr/YNOoUT2mr5CEG4PG/WdBCf5tewuibZM3uUnBFryLXmx73bk+SZJGqEAd/A3yW5z/vAW9UpA5To=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkIQp9V4xACYL8mtodza1ndeKxNLir6StUtvD3F8AxFpog8A2k
	JItdmF7P7Hofgtg1NJ9nk3HOdn4vqHd7U8cG6qmb/EP/2SGtMDxtVLM6
X-Gm-Gg: ASbGncvzmBY6XAE9npUvtt5zA1T6l287gw0tsA6pszmlaCTn+M1/JfAAY7FnqrSkBgt
	ZEFzjM4Xqbe5HdJBWAm5yqY7DCsnylWfz1poKTGk63DZO06xBG9cO9UycMleR0G84HIabpcER2S
	44XsxoQTpssXmBC9MUIJI/h0+Kq/rjMz0qDvJ4Xvt5SB6dppDc7nFoQkbWUj5EhvfNY08c5W6b2
	nIbPpy4qPmuKB2jIs7HvwnAvXGQOaHyuvqL5gSZ/LL8HS4SbMxQzoRajw6+9WQjSqZf3zGkoh9+
	DyFVkB5JmUGoIIYJMu5+8mb0tLKjd6HsrLkIk04WzjEDU9qCSVd3DnZ5/ULm0A5UyDQXl8HE0UA
	T66PZbGlxoQ8Yy64vlRtpWNHrA6is67++aQ+epUIikLwN2hoJMUEIn07CXWs7zchczZL3Qg==
X-Google-Smtp-Source: AGHT+IEmGC1fJcE4OAtV0Owu2fNKpRqQY3VzTeskRzxNQPbLVeyWOXOzToL4xIfj+nPDKGb1lmA/VA==
X-Received: by 2002:a17:902:ce07:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-297c00b9141mr3517035ad.14.1762448328641;
        Thu, 06 Nov 2025 08:58:48 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c880c5sm3013244a12.6.2025.11.06.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:58:47 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Date: Thu, 06 Nov 2025 22:02:39 +0530
Message-ID: <87ikfn3yvs.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com> <87ms5050g0.ritesh.list@gmail.com> <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Alexander Gordeev <agordeev@linux.ibm.com> writes:

> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>> > + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> > + * currently enabled.
>> >   */
>> >  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> >  static inline void lazy_mmu_mode_enable(void)
>> >  {
>> > -	arch_enter_lazy_mmu_mode();
>> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> > +
>> > +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>> > +	/* enable() must not be called while paused */
>> > +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>> > +
>> > +	if (state->nesting_level++ == 0) {
>> > +		state->active = true;
>> > +		arch_enter_lazy_mmu_mode();
>> > +	}
>> >  }
>> 
>> Some architectures disables preemption in their
>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
>
> Do you have some scenario in mind that could cause an issue?
>
No not really. But that's a deviation from what previous arch hooks were
expecting. Although thinking this through - I don't have any usecase
where this can be a problem. 

But let me re-visit some of the code paths on ppc64 lazy mmu... 

Looking at the arch specific usecase I see we always do get_cpu_var()
for accessing the per-cpu batch array which disables preemption before
accessing the per-cpu structure.. This per-cpu structure is where we
batch pte updates... 

For e.g... 
  
    arch_enter_lazy_mmu_mode()
        hpte_need_flush()
            get_cpu_var()   // this takes care of preempt_disable() 
            adds vpns to per-cpu batch[i]
            put_cpu_var()   // 
    arch_leave_lazy_mmu_mode()

> IOW, what could go wrong if the process is scheduled to another
> CPU before preempt_disable() is called?

So from above - I don't think your sequence to update
   state->active = true 
before calling arch_enter hook should be a problem.
Based on above this looks mostly ok to me.

-ritesh

