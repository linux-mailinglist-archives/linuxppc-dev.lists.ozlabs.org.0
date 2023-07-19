Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C737759761
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 15:51:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mSLGK2c7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5cfb0bcBz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:51:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mSLGK2c7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5ccv0vp3z30Np
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 23:49:33 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31454996e06so6503962f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689774570; x=1692366570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JeaSSoZd0P4aBDcnBZ8BgOhayrU2NW5OGYbO05NkL/4=;
        b=mSLGK2c7L5EE4FfadrFnGKrx8rHqMorl3CkK/H11fHsq3cy4XSsKtutECoQcxj7VUH
         6217O/9tcynPgDcZCiS5kwgKPRQ9yaxcBfet9pGpjP3OtetZCluXE3f4KQeLL37dXcdq
         Shyafc4xZzvzAf3/I3duYT0A6Lan59ePh67EPf8B6LGZv9LJEeK4tH3b6lkOaji6veEW
         jV3wN5L8eRb0FEZEQdFL5i8bBvckl20VHoXJydGdhlh18d4M6Z7KwE4oD2NfJGaix4SY
         m60NOgE8+OkCmcQdiCC141H+NDbenv1Kvjlt/AYNlG4in4PaDFI5cUWT/kWWjIB6GhTf
         8q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689774570; x=1692366570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeaSSoZd0P4aBDcnBZ8BgOhayrU2NW5OGYbO05NkL/4=;
        b=ITnV7UtNU6GLZuX7UcgNR7SKKp8IvB95YQFMw/+u+qG/bs0XIb86ExC9yGnrN4wUXo
         kVCi4BMEQ0RXL2kkcD43jTB9VJLCUDr4CKfsS8nSoR5tg5zXUHGM7qCSJxfjd/Utx+Ln
         dbmXpaAUpqLZqv3b+e2gL8eeluxXNJ+wNsBDN++EIhrpG8iyoUYl5iDqZveziJLhnsdw
         1zxQsvOEi6GSxe+c1DDxVx2Ka6FK4zjAGs7S1cwo1o9K8/1Zke8HQqeqEiPbLUficmlU
         P01WUHc4StbRl0pt33RTQgG22eXnN9yUm8rqsbqu82vLNfjwkfnD61bWer0+ctVE404X
         eW/g==
X-Gm-Message-State: ABy/qLZXU0Acqsa/0aB/1b35G2PPiaNmhCW5km3UkgZcRP9AHFTChx+4
	SGU8wzgH5fD+hjQwDv9An9VBJg==
X-Google-Smtp-Source: APBJJlEbRVrqi3m5ZvwiJaNOZocZP7fbMQ7EmoV04cKWj5tMJSoThE8C5X94lSqKcc5w5KB/JoRc7Q==
X-Received: by 2002:adf:d0d1:0:b0:314:824:3777 with SMTP id z17-20020adfd0d1000000b0031408243777mr13524380wrh.48.1689774570336;
        Wed, 19 Jul 2023 06:49:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.201.220])
        by smtp.gmail.com with ESMTPSA id w17-20020adfde91000000b00315a57f1128sm5357828wrl.115.2023.07.19.06.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 06:49:29 -0700 (PDT)
Message-ID: <32595080-dd79-5cf0-46e7-b82d0df8f067@linaro.org>
Date: Wed, 19 Jul 2023 15:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-6-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230719123944.3438363-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On 19/7/23 14:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The vga console driver is fairly self-contained, and only used by
> architectures that explicitly initialize the screen_info settings.
> 
> Chance every instance that picks the vga console by setting conswitchp
> to call a function instead, and pass a reference to the screen_info
> there.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/alpha/kernel/setup.c      |  2 +-
>   arch/arm/kernel/setup.c        |  2 +-
>   arch/ia64/kernel/setup.c       |  2 +-
>   arch/mips/kernel/setup.c       |  2 +-
>   arch/x86/kernel/setup.c        |  2 +-
>   drivers/firmware/pcdp.c        |  2 +-
>   drivers/video/console/vgacon.c | 68 ++++++++++++++++++++--------------
>   include/linux/console.h        |  7 ++++
>   8 files changed, 53 insertions(+), 34 deletions(-)


> @@ -1074,13 +1077,13 @@ static int vgacon_resize(struct vc_data *c, unsigned int width,
>   		 * Ho ho!  Someone (svgatextmode, eh?) may have reprogrammed
>   		 * the video mode!  Set the new defaults then and go away.
>   		 */
> -		screen_info.orig_video_cols = width;
> -		screen_info.orig_video_lines = height;
> +		vga_si->orig_video_cols = width;
> +		vga_si->orig_video_lines = height;
>   		vga_default_font_height = c->vc_cell_height;
>   		return 0;
>   	}
> -	if (width % 2 || width > screen_info.orig_video_cols ||
> -	    height > (screen_info.orig_video_lines * vga_default_font_height)/
> +	if (width % 2 || width > vga_si->orig_video_cols ||
> +	    height > (vga_si->orig_video_lines * vga_default_font_height)/
>   	    c->vc_cell_height)
>   		return -EINVAL;
>   
> @@ -1110,8 +1113,8 @@ static void vgacon_save_screen(struct vc_data *c)
>   		 * console initialization routines.
>   		 */
>   		vga_bootup_console = 1;
> -		c->state.x = screen_info.orig_x;
> -		c->state.y = screen_info.orig_y;
> +		c->state.x = vga_si->orig_x;
> +		c->state.y = vga_si->orig_y;

Not really my area, so bare with me if this is obviously not
possible :) If using DUMMY_CONSOLE, can we trigger a save_screen
/ resize? If so, we'd reach here with vga_si=NULL.

>   	}
>   
>   	/* We can't copy in more than the size of the video buffer,
> @@ -1204,4 +1207,13 @@ const struct consw vga_con = {
>   };
>   EXPORT_SYMBOL(vga_con);
>   
> +void vgacon_register_screen(struct screen_info *si)
> +{
> +	if (!si || vga_si)
> +		return;
> +
> +	conswitchp = &vga_con;
> +	vga_si = si;
> +}

