Return-Path: <linuxppc-dev+bounces-13231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03890C03521
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 22:06:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxr367v8z3cl0;
	Fri, 24 Oct 2025 07:06:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761249987;
	cv=none; b=dzMhQ7Zd6czdKID3A+jW/kXKZv04oy70kU0L15e1rF16P2lwwiW64X4UFafwK97NbZFrQX08ZAllqJndhNFOiq5leVTwUb8HwkX4MsZoMoPbcbSH1pDAuNTjLpYqIfKV4aJPkNoFrjdqckMUQA46NIXoSyx6rrZpx0cHSXxV7vwn3aul+qk4zq9BlgnUUfdA7rYAnDtHlfzpazEP2c8eY65U6YCd9lpqhiddl58mam/ObvJ8ruSayIcbGQhUadgu/wwESDNTmDhjbMS0giY/Mh4NagknrDGUNuRDsE5w1ggfALqhEo2TJA1uc6DSar5NgSa1QScAVXliL+0nG/wlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761249987; c=relaxed/relaxed;
	bh=fRPhH8Afjh5WRImY9rdVIeUYAC30QvosEDEcq3KVJj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwdM1CRd4Z34GBx8OPO1sXLHQEfjUoi3pARPiAJN3PJXSdcvd/8qT9BUN0oNzED8wSoCzrvqVGpD/jFrpBX8BbrKjPINUEbmILrSTXdkAF29kCdML0M296rU1aZKIinU9FKAelpqEHJyFTMWZu2a5c+EnD/e9aTFw8eeWNTpaI335C3qa2rDqsBWuh8dMyV7bHTWT84Rdk7LrRNEsrovqVXsJNjoym3VeJBqIKK8sqhcNZMFzxs3iuGeUC8JZrhYKhqAm+PMWOCmpj3NlS66FeCweMFhZag+8KQLe8a5Vf+3uGzgbN7F+AaRQBmSyK9ntkNOAvavmsZJm8RhwZzyrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qyt4JeH9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qyt4JeH9; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qyt4JeH9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qyt4JeH9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxr26RPXz3ckc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:06:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fRPhH8Afjh5WRImY9rdVIeUYAC30QvosEDEcq3KVJj4=;
	b=Qyt4JeH9Z9AZbKfF/L2ghJVid0t9Nb3fC6dtSRn+D57aVKvHvdeYV7aBX4dFxF3WaXS0Eu
	+2nDFKimHHdIUfrkx3VfFksHFzBG0oWarsigiN9hKFz7zapDyrp8xpmpD2W+E4xpkhWr5R
	tWC9zl2yMRzfkalwGWmYt7E/5sXhjZM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fRPhH8Afjh5WRImY9rdVIeUYAC30QvosEDEcq3KVJj4=;
	b=Qyt4JeH9Z9AZbKfF/L2ghJVid0t9Nb3fC6dtSRn+D57aVKvHvdeYV7aBX4dFxF3WaXS0Eu
	+2nDFKimHHdIUfrkx3VfFksHFzBG0oWarsigiN9hKFz7zapDyrp8xpmpD2W+E4xpkhWr5R
	tWC9zl2yMRzfkalwGWmYt7E/5sXhjZM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-LuiBNrd3NtC_a5vlqLnO4A-1; Thu, 23 Oct 2025 16:06:18 -0400
X-MC-Unique: LuiBNrd3NtC_a5vlqLnO4A-1
X-Mimecast-MFC-AGG-ID: LuiBNrd3NtC_a5vlqLnO4A_1761249978
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4710d174c31so14786845e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 13:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249978; x=1761854778;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRPhH8Afjh5WRImY9rdVIeUYAC30QvosEDEcq3KVJj4=;
        b=jdy4nANo3an+szMCsYtoQDvyE5aAhBOksjI7hwmV/p12equPoI11If7md08YXI8scg
         oyY11yGhq4Vi8p7EGQLriAiCgbaKLlX624jwgleAiBWGqekaHYHfy8vtL6Z+zrMZKzaK
         hUU+Ay8kNj76bXTog9AwMETnEJFq9NR1LqkUpmjgztF3YmikKMgDyM8pYVwFqcDnZDHp
         7v3Ejg0IUJVL8whrkbQX+rjgpp34XPGOOpibgAhmGFMiH4YxtzoUQp0FJGez4nfSA2to
         +8aqxQvOeGNmKhodxx6/pSLfpFASSRBs+4ZnuRlnOMrOvhqOjZmr7St1nicFIgqBcy2M
         05Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV81vt3sOiqySdsjp3QUStsscWRBE5bgfDBdY6+8E9Qp1FC53UE+nPLMlWqsw6DyFnN6B4/P4ja9LFg2WI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ06ayta6yyUSG3Q7q00sMOy1potX/KVLvdabX8hHFH2DVPZvS
	8bJG1ezJqxqh1IWztRIysvbPAjfjF6iJBOlX/enzPp8n9grC7I2iJhKurZT75tL0FIuQjltl/3F
	E7N6ZDRzGAl3514eGbp+1TOPg2yA9BHAwaVDFioBpXGM+ShaUfuvHZ59aahAm81mkLMc=
X-Gm-Gg: ASbGnctwb0iSjEPqZmLt0QQKXq9uqJTznFySWFCmGP+6N2Yb30SMxcFrCvuTVUwvc9U
	5EcPa+5sALT2wg2NlyMnI9fTyJ+PMm5hkZgeaRzWs7kCGhuIBDY68x4bIKzLLxFHuUGQNqXTpyQ
	9eRwgcHEaNX/dzE5LOy6XuGjvXd7BNPvgI0hOfw049YlEhpwFOQsH972apArrhgbMrpGjE7efHW
	gnNzdMluhDuMuo8R6mfHCGFq7t/C1hdzCIMqmy6WFyzNyfYrZ3NbjH2fRlnL/vyw12M+FacAM3l
	5HVlex9rwNQC2rD8R+Y4ZPRCeT73cqrM7P5TKgljyRMmoUQEFz2VrZogoOXWPOuq1Prm9AXYxnr
	5NNkMczH01/ixA4fHkF8UL3AVXDvOKDHtErFSB+MNAQKJ9LHpuGvM8Xx9bu1miybMwSNBiGsF0r
	o2kQYdPrJEBmLIx9Mc5kcN0goJats=
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr207116175e9.7.1761249977726;
        Thu, 23 Oct 2025 13:06:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGeb2fa1IYwsGJ0pSctmwGPF6xvoGIek/oRMhJoppZNw0DpnIDJSoz1KA7a/k0YpqsgRr1qQ==
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr207115995e9.7.1761249977327;
        Thu, 23 Oct 2025 13:06:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342946sm113034495e9.10.2025.10.23.13.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:06:16 -0700 (PDT)
Message-ID: <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
Date: Thu, 23 Oct 2025 22:06:14 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-12-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XZ2Ng81oEbP_CBB1eZ2QJdxDt4fEby4c7tCMu8G3B14_1761249978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15.10.25 10:27, Kevin Brodsky wrote:
> We currently set a TIF flag when scheduling out a task that is in
> lazy MMU mode, in order to restore it when the task is scheduled
> again.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode in task_struct::lazy_mmu_state. We can therefore check that
> state when switching to the new task, instead of using a separate
> TIF flag.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---


Looks ok to me, but I hope we get some confirmation from x86 / xen folks.

-- 
Cheers

David / dhildenb


