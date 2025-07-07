Return-Path: <linuxppc-dev+bounces-10129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D9AFA9B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 04:39:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bb7jj0jztz2yZ6;
	Mon,  7 Jul 2025 12:39:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751855961;
	cv=none; b=Ab6X+1Aq0FGrhC6/fgg1HSubpI0cTJkiXfuM3bWPRj94yHCkQx9Foe+OO/2bdSps7Ly8n74i6/zaduLhlqGEl6F78S0xPA4heV94dF6a/08trfdUiPVpcP69kUJRhhARvwboGTrr9EXzv4a6wD+h24pNi5KSonWX5Vp9FjGk4Al49ERcFDUjVqz2/IC+T70KN2Ina9Qq8IL5A7Hk1G1EHTEZTJBAv47o1V2OTFhMre9wNIykxAm9wgl0R7+LO690wL4c0T6E8zMihF5WV8F76b7fnyQYhLZG2+KiYpakaF1zICuRiPCDIaTdCk/hRkx9c4/maZuMac3em7M5Kp9S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751855961; c=relaxed/relaxed;
	bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6oxvmfdfMHN1vwcdJNhelsXCmqtv0vzqj7IKEsVJioGRPLZouXyilPhMIuW9EJ1HEro8VJKtaEe35f95QkzmTriIfuy/XKockYLwcyteB0h7340gMZ1GFhQiwvP/sMVOdDp43aeZF1e68wtbJ4pZrsA6t3W/i/n69vFkUn20HIhcUt3htc3FFhw5HB+H7pH0Lon+bekwLbJF/PNG2aT8RefU2IK1wif2fyBBwRFdc2ImCB/ol4YzyeelIsELuHsTKgD5yCHsqfSVK/3ChJ2OoJgKiAdqUD2ZNidtJyNGudzt6rEnFCJAYeG6QRVpguk9UQxDdFTZLvmqKgTQgO79A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mjIvQeDJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mjIvQeDJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bb7jg6KWYz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 12:39:18 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2030646b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Jul 2025 19:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751855957; x=1752460757; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
        b=mjIvQeDJpqYc1T03FLtEVigZp54HL340v6roTFeVfpKA1G9X4dCtLNlaTCFgtnQmZx
         Z6ObDV0n2I5G6f1yMDheqcMCafTcqKUgX72MNVVYAMnNWTaIN/WU0QferfivfIogg/gc
         HilCmtD63gHw6nVFVsFkl9h00ZJQ9PBlAM9qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751855957; x=1752460757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
        b=Sp9SDPlq/KPh7V6bYfw5roxQiJgfApsk2HjIDo/BPA4W8YMJ+W64XFF/mwFIbvq3PK
         R0rJjQjfUV3mstB38JQ3pEokDPcs19dYBAahRrhAh1RUgOCaT6YA4LQvwRHpQ5KJd+qn
         Fr88hweuoqr1YGz2XMsOGDi6MnTu6DZHpQpQK2XQtpAY9RoRJUdK6m28wIdhSEB9bsyp
         l5xuJXxD2gMwdtV0Vmh0LbdgC8XiQPYhG7b5+sZqbmHuJEzhAVhItCNuZWLs6reB4xwo
         wbSjis+8p0Kj7bxKXnsOOAzkXNyC/NKZDyXctHTRO267Qbg3nBnHdWkLrbRlW1lm842V
         3MbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjNIGw66YEsDjCxkgpPT5xJWBtfm8WOiV1nmQ1zK718WcTtYU67qnzuW0ONzOJmv92MfJXEuu8XH67szI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8lmMGkhg8BW6la2Yu0v2Fuddc38vgWPM9ydxcCtvoFcBRk6WF
	2KpSY/LqwKH81ohCfeKTqJZ0XS+e12BDJSybwrheSmCHLAwweKQ+nJgA3wxNU022Ww==
X-Gm-Gg: ASbGnctcWdBiq2Ct4Sq8/iOWcKV4pau1MiMvnq2jz7sKf9rmG+kjAPMzOUW1NTL7kTz
	SBFjujxx+CymAlj4gy+1b4qwr1REJkWGsIAh+y0o5d/4l+bnDrdt1uH4QNK3Q+B4HSiXBQNF9bk
	y1eOmErvR5u6HcRXjHxRN2JphjrqS6qJh7qTwD0CpfYBOY636/z33K7lQfXWMY/K4+G4OaQVhRg
	/wtJvFSlMu82t7IZ1BhF5/R3JsMCPYurBitI6VlYANBEBLJujohuVzqqa0erGRluyhz7rx0dRCI
	9nyji3wBbIj19yTQlfiGz9u6izZAcxi7Jz5osGyAnqr1uMrskZYRovUcp135nwY/AA==
X-Google-Smtp-Source: AGHT+IEurZuttkS95VnXcSGu+b+8TgCle7ih6/mBYzXLZUJ1AXkAhgjCuqtatOUxrSPej26STHUETw==
X-Received: by 2002:a05:6a20:4328:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-226095a5143mr15866459637.10.1751855956675;
        Sun, 06 Jul 2025 19:39:16 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:5470:7382:9666:68b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee74cf48sm7419649a12.77.2025.07.06.19.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 19:39:16 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:39:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <5bc5vidilgjb37qypdlinywm64j447wtkirbmqdbmba2bgr3ob@22so3brrpctt>
References: <20250704102524.326966-1-david@redhat.com>
 <20250704102524.326966-13-david@redhat.com>
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
In-Reply-To: <20250704102524.326966-13-david@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/07/04 12:25), David Hildenbrand wrote:
> Instead, let's check in the callbacks if the page was already destroyed,
> which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).
> 
> If we detect that the page was destroyed:
> 
> (1) Fail isolation, just like the migration core would
> 
> (2) Fake migration success just like the migration core would
> 
> In the putback case there is nothing to do, as we don't do anything just
> like the migration core would do.
> 
> In the future, we should look into not letting these pages get destroyed
> while they are isolated -- and instead delaying that to the
> putback/migration call. Add a TODO for that.
> 
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

