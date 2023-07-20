Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8687875B726
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 20:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6MHb1d0Tz3cWh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 04:52:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gonehiking.org (client-ip=64.68.200.34; helo=mailout.easymail.ca; envelope-from=khalid@gonehiking.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 166 seconds by postgrey-1.37 at boromir; Fri, 21 Jul 2023 04:51:41 AEST
Received: from mailout.easymail.ca (mailout.easymail.ca [64.68.200.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6MH16btpz304l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 04:51:41 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mailout.easymail.ca (Postfix) with ESMTP id C590A620B6;
	Thu, 20 Jul 2023 18:51:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo09-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
	by localhost (emo09-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdAW74Bt-UdA; Thu, 20 Jul 2023 18:51:38 +0000 (UTC)
Received: from mail.gonehiking.org (unknown [38.15.45.1])
	by mailout.easymail.ca (Postfix) with ESMTPA id F357A61E5F;
	Thu, 20 Jul 2023 18:51:37 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
	by mail.gonehiking.org (Postfix) with ESMTP id D5A1F3EED6;
	Thu, 20 Jul 2023 12:51:35 -0600 (MDT)
Message-ID: <2517a38e-9a3b-07b1-85ff-270601d52c45@gonehiking.org>
Date: Thu, 20 Jul 2023 12:51:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-6-arnd@kernel.org>
From: Khalid Aziz <khalid@gonehiking.org>
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
Reply-To: khalid@gonehiking.org
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/23 6:39 AM, Arnd Bergmann wrote:
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

PCDP and ia64 changes look good to me.

Acked-by: Khalid Azzi <khalid@gonehiking.org>

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
> 
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index b4d2297765c02..d73b685fe9852 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -655,7 +655,7 @@ setup_arch(char **cmdline_p)
>   
>   #ifdef CONFIG_VT
>   #if defined(CONFIG_VGA_CONSOLE)
> -	conswitchp = &vga_con;
> +	vgacon_register_screen(&screen_info);
>   #endif
>   #endif
>   
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 40326a35a179b..5d8a7fb3eba45 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -1192,7 +1192,7 @@ void __init setup_arch(char **cmdline_p)
>   
>   #ifdef CONFIG_VT
>   #if defined(CONFIG_VGA_CONSOLE)
> -	conswitchp = &vga_con;
> +	vgacon_register_screen(&screen_info);
>   #endif
>   #endif
>   
> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
> index d2c66efdde560..2c9283fcd3759 100644
> --- a/arch/ia64/kernel/setup.c
> +++ b/arch/ia64/kernel/setup.c
> @@ -619,7 +619,7 @@ setup_arch (char **cmdline_p)
>   		 * memory so we can avoid this problem.
>   		 */
>   		if (efi_mem_type(0xA0000) != EFI_CONVENTIONAL_MEMORY)
> -			conswitchp = &vga_con;
> +			vgacon_register_screen(&screen_info);
>   # endif
>   	}
>   #endif
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 1aba7dc95132c..6c3fae62a9f6b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -794,7 +794,7 @@ void __init setup_arch(char **cmdline_p)
>   
>   #if defined(CONFIG_VT)
>   #if defined(CONFIG_VGA_CONSOLE)
> -	conswitchp = &vga_con;
> +	vgacon_register_screen(&screen_info);
>   #endif
>   #endif
>   
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index fd975a4a52006..b1ea77d504615 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1293,7 +1293,7 @@ void __init setup_arch(char **cmdline_p)
>   #ifdef CONFIG_VT
>   #if defined(CONFIG_VGA_CONSOLE)
>   	if (!efi_enabled(EFI_BOOT) || (efi_mem_type(0xa0000) != EFI_CONVENTIONAL_MEMORY))
> -		conswitchp = &vga_con;
> +		vgacon_register_screen(&screen_info);
>   #endif
>   #endif
>   	x86_init.oem.banner();
> diff --git a/drivers/firmware/pcdp.c b/drivers/firmware/pcdp.c
> index 715a45442d1cf..667a595373b2d 100644
> --- a/drivers/firmware/pcdp.c
> +++ b/drivers/firmware/pcdp.c
> @@ -72,7 +72,7 @@ setup_vga_console(struct pcdp_device *dev)
>   		return -ENODEV;
>   	}
>   
> -	conswitchp = &vga_con;
> +	vgacon_register_screen(&screen_info);
>   	printk(KERN_INFO "PCDP: VGA console\n");
>   	return 0;
>   #else
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
> index e25ba523892e5..3d7fedf27ffc1 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -97,6 +97,8 @@ static int 		vga_video_font_height;
>   static int 		vga_scan_lines		__read_mostly;
>   static unsigned int 	vga_rolled_over; /* last vc_origin offset before wrap */
>   
> +static struct screen_info *vga_si;
> +
>   static bool vga_hardscroll_enabled;
>   static bool vga_hardscroll_user_enable = true;
>   
> @@ -161,8 +163,9 @@ static const char *vgacon_startup(void)
>   	u16 saved1, saved2;
>   	volatile u16 *p;
>   
> -	if (screen_info.orig_video_isVGA == VIDEO_TYPE_VLFB ||
> -	    screen_info.orig_video_isVGA == VIDEO_TYPE_EFI) {
> +	if (!vga_si ||
> +	    vga_si->orig_video_isVGA == VIDEO_TYPE_VLFB ||
> +	    vga_si->orig_video_isVGA == VIDEO_TYPE_EFI) {
>   	      no_vga:
>   #ifdef CONFIG_DUMMY_CONSOLE
>   		conswitchp = &dummy_con;
> @@ -172,29 +175,29 @@ static const char *vgacon_startup(void)
>   #endif
>   	}
>   
> -	/* boot_params.screen_info reasonably initialized? */
> -	if ((screen_info.orig_video_lines == 0) ||
> -	    (screen_info.orig_video_cols  == 0))
> +	/* vga_si reasonably initialized? */
> +	if ((vga_si->orig_video_lines == 0) ||
> +	    (vga_si->orig_video_cols  == 0))
>   		goto no_vga;
>   
>   	/* VGA16 modes are not handled by VGACON */
> -	if ((screen_info.orig_video_mode == 0x0D) ||	/* 320x200/4 */
> -	    (screen_info.orig_video_mode == 0x0E) ||	/* 640x200/4 */
> -	    (screen_info.orig_video_mode == 0x10) ||	/* 640x350/4 */
> -	    (screen_info.orig_video_mode == 0x12) ||	/* 640x480/4 */
> -	    (screen_info.orig_video_mode == 0x6A))	/* 800x600/4 (VESA) */
> +	if ((vga_si->orig_video_mode == 0x0D) ||	/* 320x200/4 */
> +	    (vga_si->orig_video_mode == 0x0E) ||	/* 640x200/4 */
> +	    (vga_si->orig_video_mode == 0x10) ||	/* 640x350/4 */
> +	    (vga_si->orig_video_mode == 0x12) ||	/* 640x480/4 */
> +	    (vga_si->orig_video_mode == 0x6A))	/* 800x600/4 (VESA) */
>   		goto no_vga;
>   
> -	vga_video_num_lines = screen_info.orig_video_lines;
> -	vga_video_num_columns = screen_info.orig_video_cols;
> +	vga_video_num_lines = vga_si->orig_video_lines;
> +	vga_video_num_columns = vga_si->orig_video_cols;
>   	vgastate.vgabase = NULL;
>   
> -	if (screen_info.orig_video_mode == 7) {
> +	if (vga_si->orig_video_mode == 7) {
>   		/* Monochrome display */
>   		vga_vram_base = 0xb0000;
>   		vga_video_port_reg = VGA_CRT_IM;
>   		vga_video_port_val = VGA_CRT_DM;
> -		if ((screen_info.orig_video_ega_bx & 0xff) != 0x10) {
> +		if ((vga_si->orig_video_ega_bx & 0xff) != 0x10) {
>   			static struct resource ega_console_resource =
>   			    { .name	= "ega",
>   			      .flags	= IORESOURCE_IO,
> @@ -231,12 +234,12 @@ static const char *vgacon_startup(void)
>   		vga_vram_base = 0xb8000;
>   		vga_video_port_reg = VGA_CRT_IC;
>   		vga_video_port_val = VGA_CRT_DC;
> -		if ((screen_info.orig_video_ega_bx & 0xff) != 0x10) {
> +		if ((vga_si->orig_video_ega_bx & 0xff) != 0x10) {
>   			int i;
>   
>   			vga_vram_size = 0x8000;
>   
> -			if (!screen_info.orig_video_isVGA) {
> +			if (!vga_si->orig_video_isVGA) {
>   				static struct resource ega_console_resource =
>   				    { .name	= "ega",
>   				      .flags	= IORESOURCE_IO,
> @@ -327,14 +330,14 @@ static const char *vgacon_startup(void)
>   	    || vga_video_type == VIDEO_TYPE_VGAC
>   	    || vga_video_type == VIDEO_TYPE_EGAM) {
>   		vga_hardscroll_enabled = vga_hardscroll_user_enable;
> -		vga_default_font_height = screen_info.orig_video_points;
> -		vga_video_font_height = screen_info.orig_video_points;
> +		vga_default_font_height = vga_si->orig_video_points;
> +		vga_video_font_height = vga_si->orig_video_points;
>   		/* This may be suboptimal but is a safe bet - go with it */
>   		vga_scan_lines =
>   		    vga_video_font_height * vga_video_num_lines;
>   	}
>   
> -	vgacon_xres = screen_info.orig_video_cols * VGA_FONTWIDTH;
> +	vgacon_xres = vga_si->orig_video_cols * VGA_FONTWIDTH;
>   	vgacon_yres = vga_scan_lines;
>   
>   	return display_desc;
> @@ -379,7 +382,7 @@ static void vgacon_init(struct vc_data *c, int init)
>   	/* Only set the default if the user didn't deliberately override it */
>   	if (global_cursor_default == -1)
>   		global_cursor_default =
> -			!(screen_info.flags & VIDEO_FLAGS_NOCURSOR);
> +			!(vga_si->flags & VIDEO_FLAGS_NOCURSOR);
>   }
>   
>   static void vgacon_deinit(struct vc_data *c)
> @@ -607,7 +610,7 @@ static int vgacon_switch(struct vc_data *c)
>   {
>   	int x = c->vc_cols * VGA_FONTWIDTH;
>   	int y = c->vc_rows * c->vc_cell_height;
> -	int rows = screen_info.orig_video_lines * vga_default_font_height/
> +	int rows = vga_si->orig_video_lines * vga_default_font_height/
>   		c->vc_cell_height;
>   	/*
>   	 * We need to save screen size here as it's the only way
> @@ -627,7 +630,7 @@ static int vgacon_switch(struct vc_data *c)
>   
>   		if ((vgacon_xres != x || vgacon_yres != y) &&
>   		    (!(vga_video_num_columns % 2) &&
> -		     vga_video_num_columns <= screen_info.orig_video_cols &&
> +		     vga_video_num_columns <= vga_si->orig_video_cols &&
>   		     vga_video_num_lines <= rows))
>   			vgacon_doresize(c, c->vc_cols, c->vc_rows);
>   	}
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
> +
>   MODULE_LICENSE("GPL");
> diff --git a/include/linux/console.h b/include/linux/console.h
> index d3195664baa5a..5f900210e689e 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -101,6 +101,13 @@ extern const struct consw dummy_con;	/* dummy console buffer */
>   extern const struct consw vga_con;	/* VGA text console */
>   extern const struct consw newport_con;	/* SGI Newport console  */
>   
> +struct screen_info;
> +#ifdef CONFIG_VGA_CONSOLE
> +void vgacon_register_screen(struct screen_info *si);
> +#else
> +static inline void vgacon_register_screen(struct screen_info *si) { }
> +#endif
> +
>   int con_is_bound(const struct consw *csw);
>   int do_unregister_con_driver(const struct consw *csw);
>   int do_take_over_console(const struct consw *sw, int first, int last, int deflt);

