Return-Path: <linuxppc-dev+bounces-13893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E4C3CB89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 18:09:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2TDz6ydnz3069;
	Fri,  7 Nov 2025 04:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762448947;
	cv=none; b=VW9zBpIMnW34jAmHQrS0XUHsi6uVoJzM3VdNK71G2y6tg08kyP3DAVZX+CTrOr2N9ImvJF3y+Ba3yfl4yHUF3Il0TKIgne8dB7/WCDD1puQfWsu2cWrVeO8q1gz5yuIzlVpI9WCPSVz/hcYHQRvpDz6tsBqBdsCuAglrjhk6mjAYl7dzBzbkx7Yg/Y9TO/oT95fI7Fu4ZS8lCsX+pHdhEbXWICSWshpym5Cf+bIiyHtiF5oMpwKff2g2sJ/Lwobsoxu2hXJOGS0ZtOjF4++K8AvwC4oB2Y0ai2jK1O+JLVEqRbi+u0MtNyThfZ0tnrylS4hUDKg38PwQVJCfR+fCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762448947; c=relaxed/relaxed;
	bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=Jtb9HkqQNHobcvCVacswL/w18NmwZqGX/Jk+9yupJ2FEA1GKPKOPTvM9XafX+mJq/hYlDVHWeqLmP9GlyVqnN/ZrxH+J30+rYtDYRoeUVuw7tWdK22AhobKpXnChKzmSwg1yid854n/E4NdRcx6OZazyR1sScR+tuTGF67RBPHq+7dxKu7KI+TDq9DXOnaHRIlhZuENvQtLCdPfXfhnJhuoqhtVDF4QImo8+xwPbcF1DVVqd9peUyvU5YPaUxzg7Mj2Fszn5++n8nw5162Ppy/UsUjKOwH7NGh3oxkXWfhj3OtMBGYhD4NQldA8KYkptQJ23EophkKr8OA6BnV83HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fw5nikUJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fw5nikUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2TDy4P3Pz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 04:09:06 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7aca3e4f575so1117700b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Nov 2025 09:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448943; x=1763053743; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
        b=Fw5nikUJIJ9pWEAyKl19JghOfDbz0sbTbjMstSP2TKPyD2/szXmZLp0mDFHINX2qw8
         t1jjB07uHAHCzgrdE2J50FUAgQj8t5CHCnNcZdkz35NQQkCKggq+0pv7riuMprVkf1Xy
         AjwWaId/AmfLgWGrjo/cld0Q7u/iSsYNGeCduM+6+r59RY4+ybUNOKr+xEPyRwXHCXqb
         a9QZH7H+6j6jRZ0yk/dvtLi4wgZ3L9OJeFvJxwt+B+hPWgi8EKoyYFSfux2KpMG92JWj
         CvD/jjUGL87EhE6qB5SLZuhv/VIX8xdDn3S6sKK3KL0vb+VBfz1MWvv+mWJtmylq+wh7
         dl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448943; x=1763053743;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
        b=lYBp/EVgpWqeGuPiGfX0SvS0ECY8cdh2fMKF9thWqpfZfLsyk0eB9mKWx2u0lcj2zl
         AUv0EEZ+5pDKAWketNASHmtvc2tchbv0sgsYLdhMoAdqEHdi8PDKY2ieMya8NFQByJS3
         ncKeXKEMvjPXvWIsQlkj+Jy81xWdrE5mRJ779Gyi1A8UpYE8EVvzZBJ216s7DTPmDQhK
         YzHpf1nEWnn0h/4Y8zkqCWIjgFWkuOvPtEDKLFK0CZf2MXFDoUz+AiVLaL0f9hkZZm3S
         s1sWKuVy9XkJGav6oa3Bt7+wr4qilbUEK5KwnrrYcC2bWk/bK9Ko2ktQoBVcQJr0eKyw
         OpVA==
X-Forwarded-Encrypted: i=1; AJvYcCUui9xTWDOu6Z2WI7W22Y/rwxzgYT741Aisc9fuGoYv0Jjp3TFCmtSfuMlBeC7YRPStBnanf84ee2q9JHY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxzYC5N/caWlqmobVrOr77GHaczHUMwBCyGgXmhkmR6G+NGjN1
	9TdgBIF5QFw3+12NR9KnCNCdwBEcics9ihSXl73AqIMZE00zQetIjWHs
X-Gm-Gg: ASbGncuXT8XZv+Ajjv0gVuHHL3PsGCOKmqH7eAHBI3Dky8+gPPXnWqVNCLcmmAqCP/f
	nTMQfq6NiWnxdn76eJJNRLBj9rk9bWxQmz7w5wTxvROPS7n36l908f+pqKK4hS+dZ6/hoA/4XWg
	QBUESVlpquNHWRsAgQBEbKeLig2S1HaylmYNureO996T9KIM5aqGU26cgN3TMrc8MgH7IZ8/j4t
	jJjqi2JyyqaD6BWumf4Jwk65mei/kG7ETo2p+vxMLACMMRRjBT3gC0PLLJK08a494neXl9nl/wJ
	DifmC8vb6QbwZv+wMg2BM18/X4k3IloLHfHeCMZbaQeCUMmug6hx2dAjHYCZeCVQBtLqin7INQl
	c1miWWZNSRafvYeDVwd+F/KXtFgVcM5uIW230FIndAQSu3J2Ll+MEwZJiL9giwAQvfGOCwA==
X-Google-Smtp-Source: AGHT+IGcGbtG/gxArci+CopvKuv0vsWkSHD0Cj0H8EsVfNgzuLLOXCCQpVWCS8AAZU2IHguSNAAo3Q==
X-Received: by 2002:aa7:88c2:0:b0:7a9:f465:f25 with SMTP id d2e1a72fcca58-7b0bdb856abmr331762b3a.27.1762448942695;
        Thu, 06 Nov 2025 09:09:02 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c0874bsm68007b3a.16.2025.11.06.09.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:09:02 -0800 (PST)
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
In-Reply-To: <87ikfn3yvs.ritesh.list@gmail.com>
Date: Thu, 06 Nov 2025 22:31:27 +0530
Message-ID: <87h5v73xjs.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com> <87ms5050g0.ritesh.list@gmail.com> <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com> <87ikfn3yvs.ritesh.list@gmail.com>
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

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> For e.g... 
>   
>     arch_enter_lazy_mmu_mode()
>         hpte_need_flush()
>             get_cpu_var()   // this takes care of preempt_disable() 
>             adds vpns to per-cpu batch[i]
>             put_cpu_var()   // 
>     arch_leave_lazy_mmu_mode()
>

Sorry, here is the more accurate call sequence for previous email.

caller()... 
     arch_enter_lazy_mmu_mode()
     ptep_xxx_()
        pte_update()
             hpte_need_flush()
                get_cpu_var()   // this takes care of preempt_disable() 
                adds vpns to per-cpu batch[i]
                put_cpu_var()   // 
     arch_leave_lazy_mmu_mode()

-ritesh

