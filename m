Return-Path: <linuxppc-dev+bounces-8524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9454AB4DF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 10:24:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxTzg43B5z2xRs;
	Tue, 13 May 2025 18:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747124687;
	cv=none; b=ligO0OCc4y53rn9IFTeJ7gzyKY1uIcknjoXoK1kSFpu94dqEMjAAcSuvVTw6+R0jKlgrCufypNTJaNyUm6GKi22Bx/y8L85AvhiwWZMrJxWO+Q6VmoRcLgwznG+kghSlEfAefV2FQbRcWks+WRGAopJhGmC97Ump+OopY0zVhXTCkfNoHDo9BOHVEA094B1pjmvdXWaX5ZqOy1KzI/oXtceMqysSwzfuBDQNzMXRg5g8PfB1Mm5b5twyaaUXf7y+dclltGeOteMgi3qaliHWousGgOodw10RgWNLw1B3EmTwv1bPwe3uoTMWmw1J9Ervc7sjqKItZQRCdLP4wV4Srw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747124687; c=relaxed/relaxed;
	bh=YHA/wvWEDB8CgIoUnHtp7szR/abPgZrTVkvyNlmczCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXlokgX8GYV0Iu0u4p9blB/pvGH00fBUYcYJyZfNYLXFA7/GVAojerbyVsjQA8g+qTthK+4El0Wj5HoNf7Gz4UqvCYZF0SxKV1PHetuQSE/957RCzUw08S3+uPxIz2Ks6b+KSzSAv2MPuPWDTMN6AJdRmTp1Wa48RJuFvUoBqrc8GFV5IcPaGy5JN656uA0Pd9sWRyanQ9q8iSRL+6txLUpZfyE230ySNfEd+h5ZLnB7EUaFBD0Aorwt2dMYmovhQSXDUP2Ri8jowmmG9VGZftQyJnCHF05dY/yZ1z/kKXq/vM3AGDDmlIcAEc+sH6lbP3GZjEe6uvvz8lEdghlPSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pOsLeKXo; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pOsLeKXo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxTzf3JhZz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 18:24:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA3395C66A2;
	Tue, 13 May 2025 08:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC30C4CEE4;
	Tue, 13 May 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747124682;
	bh=YHA/wvWEDB8CgIoUnHtp7szR/abPgZrTVkvyNlmczCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOsLeKXoaJjDR7Uej2TlJeM6ZmoE7XJ1eY2NW6EWvVbEdYKdNoHifU2oYl1NCpNcj
	 05cGqKrPBX7tyjVBdRbn+SzIcuKHPlRsbgqJK46eiiMZYYcMLDd0yoBzk0zcctZoT5
	 88rkSUu8KWAF+m3PM71lYiXI9gs2yzOsFIA4FLyZ0jTr5Y8FLRYvi4dISD8QFo1ATr
	 S8P/VCDjGSYzbJcqt8ZzQMjAuYW7D/ZCcdarVIO5Bue5AhTUxLrTClQ71Dn2txfTwz
	 OstRPVaqa7P4ms/78eMW1q+EnE6838KH/802tcNklQ2fgt7QYGzRyfY/YjRkQZm0NM
	 uPsFhWO1hBI/A==
Date: Tue, 13 May 2025 10:24:27 +0200
From: Christian Brauner <brauner@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <20250513-wunden-tierzucht-0cd8fb32bb0e@brauner>
References: <20250512-xattrat-syscall-v5-0-a88b20e37aae@kernel.org>
 <vxjuophuvmvqloczajfyjd5jvvcbvcty2fpvfmcaz5xuh5vyqv@fxiymeww26mf>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vxjuophuvmvqloczajfyjd5jvvcbvcty2fpvfmcaz5xuh5vyqv@fxiymeww26mf>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Ignore please, somehow b4 crashed with timeout on gmail

Ok, no worries. I wondered why I didn't get all messages of that series.

