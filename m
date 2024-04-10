Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC689F05B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 13:08:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF0Sc1Cqtz3vbb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 21:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sre@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDwKq683Yz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 18:02:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 019B5CE2645;
	Wed, 10 Apr 2024 08:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDFDC43390;
	Wed, 10 Apr 2024 08:02:36 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 324081063262; Wed, 10 Apr 2024 10:02:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 00/34] address all -Wunused-const warnings
Message-Id: <171273615213.1094883.18382201508159771859.b4-ty@collabora.com>
Date: Wed, 10 Apr 2024 10:02:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Wed, 10 Apr 2024 21:08:28 +1000
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-sound@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>, linux-omap@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>, Alex Elder <elder@kernel.org>, Tero Kristo <kristo@kernel.org>, Xiang Chen <chenxiang66@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Alexandre Be
 lloni <alexandre.belloni@bootlin.com>, Markuss Broks <markuss.broks@gmail.com>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Yisen Zhuang <yisen.zhuang@huawei.com>, Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, Anna Schumaker <anna@kernel.org>, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, Jonathan Cameron <jic23@kernel.org>, linux-efi@vger.kernel.org, linux-iio@vger.kernel.org, linux-fpga
 @vger.kernel.org, linux-fbdev@vger.kernel.org, kasan-dev@googlegroups.com, Jiri Slaby <jirislaby@kernel.org>, linux-rtc@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>, Masahiro Yamada <masahiroy@kernel.org>, linux-staging@lists.linux.dev, linux-input@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jikos@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>, openipmi-developer@lists.sourceforge.net, linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>, linux-stm32@st-md-mailman.stormreply.com, Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-ide@vger.kerne
 l.org, Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Kalle Valo <kvalo@kernel.org>, John Allen <john.allen@amd.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 03 Apr 2024 10:06:18 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> [...]

Applied, thanks!

[09/34] power: rt9455: hide unused rt9455_boost_voltage_values
        commit: 452d8950db3e839aba1bb13bc5378f4bac11fa04

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

