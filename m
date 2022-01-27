Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832649E708
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:06:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl5792cXCz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:06:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=TlM0+ND9;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wKReWxNy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=TlM0+ND9; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wKReWxNy; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl56R202wz3bP4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:05:50 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 355801F3A9;
 Thu, 27 Jan 2022 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643299546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dff1mehmwy7lYfM1LSu0jEYbA2aOIzDLjNE1uhGynPU=;
 b=TlM0+ND9JjYYgVXvFx2Z+bO2cn/xPc2sEla+MbumW2dsnjVCspjF5/RPHLXN4NRS2VB39i
 afmZ+9Pkm5wrGeW+q66bEA3ojcrK1z9qThU7+PyLV2fXIaMfZCnnP8MBfC9AHZukPYjWGM
 eg2qPWoLk3vvoTmyaob7wgF4Qs1+qeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643299546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dff1mehmwy7lYfM1LSu0jEYbA2aOIzDLjNE1uhGynPU=;
 b=wKReWxNyajYBEJ/WJJM9qBosVQmFTr9W/2Yehih5rr39+B6Laphi6/utBYgwtcWNCTrAuR
 x9pJ8+gp64UKo5Aw==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 16D81A3B84;
 Thu, 27 Jan 2022 16:05:45 +0000 (UTC)
Date: Thu, 27 Jan 2022 17:05:45 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 6/7] modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
In-Reply-To: <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
Message-ID: <alpine.LSU.2.21.2201271704470.26559@pobox.suse.cz>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> @@ -195,6 +208,9 @@ static void mod_tree_remove(struct module *mod)
>  {
>  	__mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
>  	mod_tree_remove_init(mod);
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +	__mod_tree_remove(&mod->core_layout.mtn, &mod_data_tree);

s/core_layout/data_layout/ ?

> +#endif
>  }

Miroslav
