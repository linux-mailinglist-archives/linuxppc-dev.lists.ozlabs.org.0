Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F08AA916
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 09:23:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ajstnip1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLR2M0jD7z3cnv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 17:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ajstnip1;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLR1c5Fp0z3blb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 17:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713511364;
	bh=y6+LJ/HKVZ3t3mY/lApMl/GxR/GrG1RUjmP1/5KDxJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ajstnip1AJQziYYZob5+/WWQw9OkiQ6HqYW6enqSgR3T/CWGp6JpdFQzdsfgccveC
	 waF4b2KpmGDJhW0uaIjTruByYiknefTsAbDI1CsuVxIlgr8/egc0ybcsQUt/stAUIl
	 raR314f9lFE/RXTMwibjefIPDZ5AB0qSRczs793ZKaBylcevAra8Aht5IRKNIO774t
	 aG3dAb/4j2sOMbQ5Iwk3E6LlLVt1iq7SfpU3a55AkDG8Tl4O8gD7WxKyVt/tO8JQz4
	 7Nt41dgDBlJelLCvurGlsjRwLg8I8J1MJ2FAUJ37oJvYirJXZTHvc5s+9d7acvo/rM
	 EtC7Y6dv3fK3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLR1c0rdDz4x0D;
	Fri, 19 Apr 2024 17:22:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Andi Shyti
 <andi.shyti@kernel.org>, Abhinav Jain <jain.abhinav177@gmail.com>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
In-Reply-To: <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
 <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
Date: Fri, 19 Apr 2024 17:22:43 +1000
Message-ID: <87plulakak.fsf@mail.lhotse>
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
Cc: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> On 16/04/24 08:54, Andi Shyti wrote:
>> Hi Abhinav,
>>
>>>   	/* Enable I2C interrupts for mpc5121 */
>>> -	node_ctrl = of_find_compatible_node(NULL, NULL,
>>> -					    "fsl,mpc5121-i2c-ctrl");
>>> +	struct device_node *node_ctrl __free(device_node) =
>> How have you tested this?
>
> I'm not sure I know anyone that still has a mpc5121. Maybe someone on 
> linuxppc-dev?

Not that I know of.

The driver loads on my T4240, but doesn't hit the right paths to test
this patch.

No objection to it being merged though.

cheers
