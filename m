Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE33735C6B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 14:49:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJpVB4sdFz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 22:49:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KwLew2ae;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XAOOXk0T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=KwLew2ae; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=XAOOXk0T; 
 dkim-atps=neutral
X-Greylist: delayed 91 seconds by postgrey-1.36 at boromir;
 Mon, 12 Apr 2021 22:49:31 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJpTl3xqBz309W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:49:31 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1618231769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l/XIlOnCEFK6wDuZUWOcTRIzT0SyL7XB9TwDJmOc63k=;
 b=KwLew2aezRXKKOl6Pmjy0VKCuN+Gg2cN80wVBDPmGgpC26I54pVChs2mzOwwjq7rlbE4bL
 wwzx9G+wKLZxwK21mjzocbgSicynrp52mDNBj3bhxXjiy8GzRWQg2Sw2VBy9zRPiExfVIa
 GQde8qdyEknJInN0pvRtX08PtZEl4sh9BMtusOx/F1lOsFstPExBvKG4Gx/r4XSt0tQc+3
 SHl0+dGXaxoWeoLML7acFg6vpHw+AwHaeVIeOKqn5i8Qal3rFoOAaQcwwAC2DNgxUa+C/B
 etustzSxZsdmhNj4lzmWuswZq4zmKo3UZZpAdR9bOYkcy9mxSmlF4z5ueATQug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1618231769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l/XIlOnCEFK6wDuZUWOcTRIzT0SyL7XB9TwDJmOc63k=;
 b=XAOOXk0TVAsPzEcoTVW4tVWa/HhqIhpKIomW9bTNeLJ821g8uwIaj2+g8oTfwzXJ9P2Sdn
 YMwkGedwPu2VniBQ==
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RESEND v1 0/4] powerpc/vdso: Add support for time
 namespaces
In-Reply-To: <cover.1617209141.git.christophe.leroy@csgroup.eu>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
Date: Mon, 12 Apr 2021 14:49:28 +0200
Message-ID: <87mtu31xd3.ffs@nanos.tec.linutronix.de>
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31 2021 at 16:48, Christophe Leroy wrote:
> [Sorry, resending with complete destination list, I used the wrong script on the first delivery]
>
> This series adds support for time namespaces on powerpc.
>
> All timens selftests are successfull.

If PPC people want to pick up the whole lot, no objections from my side.

Thanks,

        tglx
