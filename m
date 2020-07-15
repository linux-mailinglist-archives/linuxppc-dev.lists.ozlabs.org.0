Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D37622055A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:46:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B67GN5wrSzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.50.32; helo=7.mo69.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 957 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Jul 2020 16:45:13 AEST
Received: from 7.mo69.mail-out.ovh.net (7.mo69.mail-out.ovh.net [46.105.50.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B67DT0gfBzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:45:11 +1000 (AEST)
Received: from player774.ha.ovh.net (unknown [10.110.103.200])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 253CF9888A
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 08:29:09 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 0AEF8146AA8E2;
 Wed, 15 Jul 2020 06:29:02 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0052bfd424a-5f63-4d60-b697-d28668566bf1,D756FEFB7EDC1B892B7A3E282F77C60775DBB805)
 smtp.auth=groug@kaod.org
Date: Wed, 15 Jul 2020 08:28:59 +0200
From: Greg Kurz <groug@kaod.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/xive: Remove unused inline function
 xive_kexec_teardown_cpu()
Message-ID: <20200715082859.4b61560e@bahia.lan>
In-Reply-To: <20200715025040.33952-1-yuehaibing@huawei.com>
References: <20200715025040.33952-1-yuehaibing@huawei.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11687966933504858421
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfedugddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020 10:50:40 +0800
YueHaibing <yuehaibing@huawei.com> wrote:

> commit e27e0a94651e ("powerpc/xive: Remove xive_kexec_teardown_cpu()")
> left behind this, remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/include/asm/xive.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
> index d08ea11b271c..309b4d65b74f 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -155,7 +155,6 @@ static inline void xive_smp_probe(void) { }
>  static inline int  xive_smp_prepare_cpu(unsigned int cpu) { return -EINVAL; }
>  static inline void xive_smp_setup_cpu(void) { }
>  static inline void xive_smp_disable_cpu(void) { }
> -static inline void xive_kexec_teardown_cpu(int secondary) { }
>  static inline void xive_shutdown(void) { }
>  static inline void xive_flush_interrupt(void) { }
>  

