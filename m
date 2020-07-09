Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04616219A24
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:40:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Skd26F1zDrFS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 17:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.193;
 helo=mail-lj1-f193.google.com; envelope-from=k.kozlowski.k@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2ShT0fy6zDrNV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 17:38:16 +1000 (AEST)
Received: by mail-lj1-f193.google.com with SMTP id r19so1238478ljn.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 00:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j7DqbPSyBqq2qwNcdYTCxivolsap4LLnpECg1M+YJYk=;
 b=axKZq2HBWPZ8HQmhNumHWP1b8D6tFWju+QqHwPX/XajYDL7kilO0pqFRQZVD+Aiak6
 gHp9rVrZVYyRNuNaVdvi8aVHOWTj5E7l/0Kn5IU7fOd6LlmEZsKg3HslZeBh39SBmoSm
 4U09Q7hyoMMVnC07+s+3n/7hUWp+UriMpmnQ6NWIArjWvG4qHn//OfSwgjPFu6cLxCU+
 RcVtrBelLAXA8jcphdW0d9P7E+DMTJlNVN5GSOEcfItN3Ni5i4LXLiziehrYUkK0SGgE
 UYjfrbxLa/pCo2Ka+FEn1HEyISjkKzi++VYCSNgxAtXU9UzfSMgu4R6fcORVrMuce9Rn
 ujog==
X-Gm-Message-State: AOAM532rXVtog8zj372uS3lSabZE/EPrE7rPTZWrIePYrnJap2HunHDQ
 YbpdI21F/CAnHideVLToEuPzc97pz2g=
X-Google-Smtp-Source: ABdhPJwrkOg1VmskPen0ndAgGUffYWkrKR783vprCdOePKnp0T8h/KXoPOC3hmTqCSglRRVLLvqDkw==
X-Received: by 2002:a50:d8c2:: with SMTP id y2mr62468108edj.114.1594279973653; 
 Thu, 09 Jul 2020 00:32:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
 by smtp.googlemail.com with ESMTPSA id sa10sm1258696ejb.79.2020.07.09.00.32.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jul 2020 00:32:52 -0700 (PDT)
Date: Thu, 9 Jul 2020 09:32:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 virtualization@lists.linux-foundation.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 1/4] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
Message-ID: <20200709073249.GA6335@kozik-lap>
References: <20200709072837.5869-1-krzk@kernel.org>
 <20200709072837.5869-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200709072837.5869-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 09, 2020 at 09:28:34AM +0200, Krzysztof Kozlowski wrote:
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I forgot to put here one more Ack, for PowerPC:
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

https://lore.kernel.org/lkml/87ftedj0zz.fsf@mpe.ellerman.id.au/

Best regards,
Krzysztof

