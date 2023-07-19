Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF167598A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:40:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=F6uhOe0x;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RT3ufktF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5dm572hKz3cBb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 00:40:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=F6uhOe0x;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RT3ufktF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5dl50s6Mz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 00:40:00 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id C6F93580210;
	Wed, 19 Jul 2023 10:39:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 19 Jul 2023 10:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689777595; x=1689784795; bh=nZU6p3n7fickF5wKWXmSN8Sc6/MSvsFTYGP
	0irgDDx8=; b=F6uhOe0xlOcUS4dDy1oq5df2GK1xAMcbSu8LZgoyXmvhlUzRu78
	bGWxTgJiJi6zrRqVfawYfkrNgFxRyoDY1fhSxgqhl2HFLNsxG4oCXLOUvtc1H1J9
	yKpHN5YOXPSGucUUa4WBBwirLFW7BcNoa9nEJIN8VY/wxM9DZRnEh0QMcm0tWtCR
	dKTHuIxJjhaZFzLsV9DTjnLCbGrttI4s9sB6wKBYnGTTcqvQf0+2gn/VHNspuTtL
	UCPm3ZVAMHyA6sMFGbrinOOlTU5JT8hRDtp3UUk+cM86plnrvFOW8ztaQcBfW6T8
	F6uE/5iwV3Pzt0P1Egm7uCnyHKH+4DwB/7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1689777595; x=1689784795; bh=nZU6p3n7fickF5wKWXmSN8Sc6/MSvsFTYGP
	0irgDDx8=; b=RT3ufktFiEmOaEJtwn2kNPwX1CxJHO84CaryEahSFHfcxzKAOKP
	GbsmwKdkij2/wPBd7ZceYMaF8fRakoZMD4mqWlf0Zxmc3G8CDJFEJnfyubpj4GpK
	BTGeK/U7hKm6Xv3VxJI6XGVSS5z+dkFKgATEYbUSs/PzvBavnLdZpIWHdDX7DPwN
	15x30i+ixySDP0gi6hrqw9TjDxXFUe4m0DoLzGSNryLWDKksDFvYLsm8ExaZoHgl
	VF+nPTLS/vCYm/jinaZDPIrkGemb4sE71T5g0dm8v0j1hZVFJOBDNUTynb37Cocc
	llP48wfwjZ64vJQYBWEmvFIXuwbXcmFTjiw==
X-ME-Sender: <xms:ufW3ZC1LS5m9UKqBhQuPj22bYT-l75QF5t_3QZRuDsR0diLe9lLwGw>
    <xme:ufW3ZFGMC4Z62j2k7HNixKVxkcNQLWa51LhFl6gqjTpK2ZIicA3j_emCMD3xuz8zQ
    hmPOfevWc3CjAvXV24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeekgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ufW3ZK7cBwP-5t-w3Jii5GSAwmRO2vIKKvzkCybK4fyj3fTpVbuJ2w>
    <xmx:ufW3ZD226POzlBb4fCk2wx_vpHfAiQhRjkNsitzyPc0-y9jpD7VJsQ>
    <xmx:ufW3ZFEqUBBuoMKH8obMLFVqcVdLIfR3eGLzM9iysb6atqfn6fvnvQ>
    <xmx:u_W3ZHdVkYp3ilmsy75YQ8mHYcQu1Ydj0R4Y7tJxHDydj5XN6uRexQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8026EB60086; Wed, 19 Jul 2023 10:39:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <3b047cd4-a61f-44b6-830b-b4e35bfccd72@app.fastmail.com>
In-Reply-To: <32595080-dd79-5cf0-46e7-b82d0df8f067@linaro.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-6-arnd@kernel.org>
 <32595080-dd79-5cf0-46e7-b82d0df8f067@linaro.org>
Date: Wed, 19 Jul 2023 16:38:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-efi@vger.kernel.org, guoren <guoren@kernel.org>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, Dave Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Will Deacon <will@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023, at 15:49, Philippe Mathieu-Daud=C3=A9 wrote:
> On 19/7/23 14:39, Arnd Bergmann wrote:

>> @@ -1074,13 +1077,13 @@ static int vgacon_resize(struct vc_data *c, u=
nsigned int width,
>>   		 * Ho ho!  Someone (svgatextmode, eh?) may have reprogrammed
>>   		 * the video mode!  Set the new defaults then and go away.
>>   		 */
>> -		screen_info.orig_video_cols =3D width;
>> -		screen_info.orig_video_lines =3D height;
>> +		vga_si->orig_video_cols =3D width;
>> +		vga_si->orig_video_lines =3D height;
>>   		vga_default_font_height =3D c->vc_cell_height;
>>   		return 0;
>>   	}
>> -	if (width % 2 || width > screen_info.orig_video_cols ||
>> -	    height > (screen_info.orig_video_lines * vga_default_font_heigh=
t)/
>> +	if (width % 2 || width > vga_si->orig_video_cols ||
>> +	    height > (vga_si->orig_video_lines * vga_default_font_height)/
>>   	    c->vc_cell_height)
>>   		return -EINVAL;
>>  =20
>> @@ -1110,8 +1113,8 @@ static void vgacon_save_screen(struct vc_data *=
c)
>>   		 * console initialization routines.
>>   		 */
>>   		vga_bootup_console =3D 1;
>> -		c->state.x =3D screen_info.orig_x;
>> -		c->state.y =3D screen_info.orig_y;
>> +		c->state.x =3D vga_si->orig_x;
>> +		c->state.y =3D vga_si->orig_y;
>
> Not really my area, so bare with me if this is obviously not
> possible :) If using DUMMY_CONSOLE, can we trigger a save_screen
> / resize? If so, we'd reach here with vga_si=3DNULL.
>

I think it cannot happen because the only way that anything calls
into vgacon.c is through the "conswitchp =3D &vga_con;" that now happens
at the same time as the "vga_si =3D &screen_info;". It's definitely
possible that I'm missing something as well here.

     Arnd
