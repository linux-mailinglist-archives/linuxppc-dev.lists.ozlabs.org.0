Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B588AC74A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:46:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJkp3zb6z3dL7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:46:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJ6x6WY2z3cVM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:18:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNJ6g0Nzdz4x1R;
	Mon, 22 Apr 2024 18:18:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 00/34] address all -Wunused-const warnings
Message-Id: <171377378377.1025456.1313405994816400451.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 18:16:23 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 22 Apr 2024 18:46:07 +1000
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
Cc: , Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org,
	g.com@lists.ozlabs.org, linux-pm@vger.kernel.org,
	linux-sound@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>,
	linux-omap@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Alex Elder <elder@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	linux-crypto@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Markuss Broks <markuss.broks@gmail.com>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
	Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev, Yisen Zhuang <yisen.zhuang@huawei.com>,
	Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Corey Minyard <minyard@acm.org>, linux-kbuild@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analo>,
	greybus-dev@lists.linaro.org, org@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anna Schumaker <anna@kernel.org>, linux-integrity@vger.kernel.org,
	alsa-devel@alsa-project.org, Jonathan Cameron <jic23@kernel.org>,
	linux-efi@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-fbdev@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-staging@lists.linux.dev, Jiri Slaby <jirislaby@kernel>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
	openipmi-developer@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, netdev@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Tony Lindgren <tony@atomide.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-ide@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
	Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, linux-stm32@st-md-mailman.stormr,
	linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	John Allen <john.allen@amd.com>, eply.com@lists.ozlabs.org,
	Robin Murphy <robin.murphy@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Damien Le Moal <dlemoal@kernel.org>, dmaengine@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 03 Apr 2024 10:06:18 +0200, Arnd Bergmann wrote:
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> In W=1 builds, we get warnings only static const variables in C
> files, but not in headers, which is a good compromise, but this still
> produces warning output in at least 30 files. These warnings are
> almost all harmless, but also trivial to fix, and there is no
> good reason to warn only about the non-const variables being unused.
> 
> [...]

Applied to powerpc/next.

[01/34] powerpc/fsl-soc: hide unused const variable
        https://git.kernel.org/powerpc/c/01acaf3aa75e1641442cc23d8fe0a7bb4226efb1

cheers
