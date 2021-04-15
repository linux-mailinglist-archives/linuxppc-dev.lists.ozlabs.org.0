Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54683615ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 01:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLw9p62xgz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 09:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=dlBNCIJG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=dlBNCIJG; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLw9N3qfwz30F9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 09:12:39 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id h20so12963363plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 16:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=quZmVxdkfveDUtpLM1NU/LuQrdZNONtDpXYzxh0MMQU=;
 b=dlBNCIJGr0qL38amaMZRkug9NjLuSZKepOmlGO/a/0dku+GQVYqb2GS0jPTD9w2gLe
 mxyKCuERedST3RGnVbk4l07BD+E5BOSCp/2NFPvySo56I89CsE7aDSCbVRn53Jv8Ql5N
 hSp7xLsHsW85pUai/ansn/rQu7ZvTTszyfp0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=quZmVxdkfveDUtpLM1NU/LuQrdZNONtDpXYzxh0MMQU=;
 b=pexWgrbXT8W8NImyM4ozxDddtkF9zx3thHFSGlwzjAAUJIWzu6WzPxBEaMoi+1lOLn
 rixqG3/XGXY8c+Dc3aDiYzxjzBU9I2bmhszk0jbHA/3U7DMHO3ol9pFsAxy+oeCiVYpV
 CjpsIEnaSurswZKShz8/VnnKTNRa8IqRR6i5tSQuMoNKzF52+dAratTpfPCohqL7awZ3
 5TtnFkaiztqSfbVvDlV/cDCCZs5mhGZWwhrFgxELPWp5cXuoB7Slj+1qTgTfUl1N65Mz
 tchIbRXBe3oczCawbQOB7hPXHsyT02yNyUqQiOgftLIMDKFDmClSDuyHy3rVveS8yVOg
 pNAA==
X-Gm-Message-State: AOAM532QbJ3z64nrlenvBF2QO4iIHBsa20FsH3q5DXeU053U2dWX6qyH
 k+UQ+7JB3tLe6gxdmV/rmvRXwA==
X-Google-Smtp-Source: ABdhPJxtoW/lfV/Z4uQg/42K/o4Py3SAIqP7jABAruwS7PxREUqkSHGAEbZJMX/djPbOm2w9XfP5tw==
X-Received: by 2002:a17:902:59d4:b029:ea:bbc5:c775 with SMTP id
 d20-20020a17090259d4b02900eabbc5c775mr6469026plj.11.1618528357637; 
 Thu, 15 Apr 2021 16:12:37 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-3f8b-a64e-9a27-b872.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:3f8b:a64e:9a27:b872])
 by smtp.gmail.com with ESMTPSA id x11sm3055779pfr.7.2021.04.15.16.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 16:12:37 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
In-Reply-To: <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
Date: Fri, 16 Apr 2021 09:12:34 +1000
Message-ID: <8735vr16sd.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

>  static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
> -		      u64 val)
> +		      u64 val, unsigned long page_size)

Compilers can warn about unused parameters at -Wextra level.  However,
reading scripts/Makefile.extrawarn it looks like the warning is
explicitly _disabled_ in the kernel at W=1 and not reenabled at W=2 or
W=3. So I guess this is fine...

> @@ -126,7 +126,7 @@ static int ptdump_hole(unsigned long addr, unsigned long next,
>  {
>  	struct ptdump_state *st = walk->private;
>  
> -	st->note_page(st, addr, depth, 0);
> +	st->note_page(st, addr, depth, 0, 0);

I know it doesn't matter at this point, but I'm not really thrilled by
the idea of passing 0 as the size here. Doesn't the hole have a known
page size?

>  
>  	return 0;
>  }
> @@ -153,5 +153,5 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>  	mmap_read_unlock(mm);
>  
>  	/* Flush out the last page */
> -	st->note_page(st, 0, -1, 0);
> +	st->note_page(st, 0, -1, 0, 0);

I'm more OK with the idea of passing 0 as the size when the depth is -1
(don't know): if we don't know the depth we conceptually can't know the
page size.

Regards,
Daniel

