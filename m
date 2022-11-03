Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E26185FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N39NN5cqQz3f43
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 04:14:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=dominikbrodowski.net (client-ip=136.243.71.142; helo=isilmar-4.linta.de; envelope-from=linux@dominikbrodowski.net; receiver=<UNKNOWN>)
X-Greylist: delayed 588 seconds by postgrey-1.36 at boromir; Fri, 04 Nov 2022 04:13:31 AEDT
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N39MH2yHdz3cMv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 04:13:31 +1100 (AEDT)
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from owl.dominikbrodowski.net (owl.brodo.linta [10.2.0.111])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id EACA0201349;
	Thu,  3 Nov 2022 17:03:34 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
	id 7BB42801C7; Thu,  3 Nov 2022 18:03:24 +0100 (CET)
Date: Thu, 3 Nov 2022 18:03:24 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:
> The pci_bus_for_each_resource_p() hides the iterator loop since
> it may be not used otherwise. With this, we may drop that iterator
> variable definition.

Thanks for your patch!

> diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
> index ad1141fddb4c..9d92d4bb6239 100644
> --- a/drivers/pcmcia/rsrc_nonstatic.c
> +++ b/drivers/pcmcia/rsrc_nonstatic.c
> @@ -934,7 +934,7 @@ static int adjust_io(struct pcmcia_socket *s, unsigned int action, unsigned long
>  static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
>  {
>  	struct resource *res;
> -	int i, done = 0;
> +	int done = 0;
>  
>  	if (!s->cb_dev || !s->cb_dev->bus)
>  		return -ENODEV;
> @@ -960,12 +960,9 @@ static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
>  	 */
>  	if (s->cb_dev->bus->number == 0)
>  		return -EINVAL;
> -
> -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> -		res = s->cb_dev->bus->resource[i];
> -#else
> -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
>  #endif
> +
> +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
>  		if (!res)
>  			continue;

Doesn't this remove the proper iterator for X86? Even if that is the right
thing to do, it needs an explict explanation.

>  
> diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
> index 3966a6ceb1ac..b200f2b99a7a 100644
> --- a/drivers/pcmcia/yenta_socket.c
> +++ b/drivers/pcmcia/yenta_socket.c
> @@ -673,9 +673,8 @@ static int yenta_search_res(struct yenta_socket *socket, struct resource *res,
>  			    u32 min)
>  {
>  	struct resource *root;
> -	int i;
>  
> -	pci_bus_for_each_resource(socket->dev->bus, root, i) {
> +	pci_bus_for_each_resource_p(socket->dev->bus, root) {
>  		if (!root)
>  			continue;
>  

That looks fine!

Thanks,
	Dominik
