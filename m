Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17684EFDD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 06:15:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ql12PmRr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWMWd1WJ3z3cPh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 16:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ql12PmRr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWMVw1yQJz2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 16:15:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707455717;
	bh=JVP7+dHngWW5QqFjEB3Li2tXHIk33S+0+gwI4qejE7A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ql12PmRrPeN6w15lje0jOXjYkyY4Zd3bn4cGc9CmK5XAkHEd2zUxKooodVCroXa45
	 kQV1oAv/jc19j1oapUa9U1naSax2L39VnHTlJ4XWJ+5o+x0q5doggVed4SEmfx16AR
	 47Va7RWrUaEWrCijh4RGdaIOgfgCLjBCJ6uN/a7zaJODkKr80vu3wIYPLweb4b97OM
	 IzMTkga+Mpg34Ji2O3+9htpWgzzL087MgTWe/OWyxTcafRRpWZAWpqZ6ibmmHv5KnB
	 KQl4189OKresii4X6aw1xpo50zNSuDxE+Ly/sLi6jGwt2h0avLb4qRNLwgQFeqscv4
	 TJxv47moU5mVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TWMVr4k82z4wcD;
	Fri,  9 Feb 2024 16:15:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers/ps3: select VIDEO to provide cmdline functions
In-Reply-To: <e0893d21-606e-429e-a554-c9ee60fd0ae4@suse.de>
References: <20240207161322.8073-1-rdunlap@infradead.org>
 <e0893d21-606e-429e-a554-c9ee60fd0ae4@suse.de>
Date: Fri, 09 Feb 2024 16:15:15 +1100
Message-ID: <8734u28bh8.fsf@mail.lhotse>
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
Cc: linux-fbdev@vger.kernel.org, Geoff Levand <geoff@infradead.org>, dri-devel@lists.freedesktop.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Am 07.02.24 um 17:13 schrieb Randy Dunlap:
>> When VIDEO is not set, there is a build error. Fix that by selecting
>> VIDEO for PS3_PS3AV.
>>
>> ERROR: modpost: ".video_get_options" [drivers/ps3/ps3av_mod.ko] undefined!
>>
>> Fixes: dae7fbf43fd0 ("driver/ps3: Include <video/cmdline.h> for mode parsing")
>> Fixes: a3b6792e990d ("video/cmdline: Introduce CONFIG_VIDEO for video= parameter")
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Geoff Levand <geoff@infradead.org>
>> Acked-by: Geoff Levand <geoff@infradead.org>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Can you take it via whatever tree the CONFIG_VIDEO patch is in?

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
