Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C73DE55FD0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 12:22:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXyFs4zXJz3fDp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:22:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WSOPwqk+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=heikki.krogerus@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WSOPwqk+;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXth24218z3bmL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656488498; x=1688024498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hRLWAheTUgpMqJ+CTyhb8q72eqCf5jXCD+qdlPmQdX8=;
  b=WSOPwqk+yqtoALqRx/TsoJTca5RUQOotxy8lqd9Ozo1OVQ+X2Q1pwj4c
   CuPvVOJzaCfb8WhjeYdxJYxA0V1NuCcumPn8iBynyWp/H2SS4HmYdKFjh
   fPXKZRryOlm+uTAanmaW7ND7q8bHv8SHfZkiGztxwPc2fkr2Z6oS5hnPf
   fTz+p3ChFnGKPzjJqo3C04T9iFFdZEVGiHSFBgzrX5cCJGg6M/fXY0Znf
   S3O9WHEgHR6bzEekVdlMBwjZzidpDip4zm5WMZ3+D22wt70uQGEz3OSQm
   ovJUmwCXHddmyQcKYtUu7wYh3IFZbMQTO+U7P04d+PaZVAtLq2K3RNwDS
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="280716473"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="280716473"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 00:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="733074160"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 29 Jun 2022 00:40:24 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 29 Jun 2022 10:40:23 +0300
Date: Wed, 29 Jun 2022 10:40:23 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <YrwB5xPKZmHlXzrC@kuha.fi.intel.com>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 29 Jun 2022 20:19:09 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Douglas Anderson <dianders@chromium.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Paul Mackerras <paulus@samba.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Guenter Roeck <groeck@chromium.org>, Peter Huewe <peterhuewe@gmx.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Phong LE <ple@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Karlman <jonas@kwiboo.se>,
	Russell King <linux@armlinux.org.uk>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Martin Donnelly <martin.donnelly@ge.com>,
	Corey Minyard <minyard@acm.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Scott Wood <oss@buserror.net>, Benson Leung <bleung@chromium.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Robert Foss <robert.foss@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, Broad@lists.ozlabs.org,
	Luca Ceresoli <luca@lucaceresoli.net>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index cd47c3597e19..2a58185fb14c 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -245,14 +245,12 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	return ret;
>  }
>  
> -static int hd3ss3220_remove(struct i2c_client *client)
> +static void hd3ss3220_remove(struct i2c_client *client)
>  {
>  	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
>  
>  	typec_unregister_port(hd3ss3220->port);
>  	usb_role_switch_put(hd3ss3220->role_sw);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id dev_ids[] = {
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index 6184f5367190..d6495e533e58 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -181,14 +181,12 @@ static int fsa4480_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int fsa4480_remove(struct i2c_client *client)
> +static void fsa4480_remove(struct i2c_client *client)
>  {
>  	struct fsa4480 *fsa = i2c_get_clientdata(client);
>  
>  	typec_mux_unregister(fsa->mux);
>  	typec_switch_unregister(fsa->sw);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id fsa4480_table[] = {
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
> index 6ce9f282594e..1cd388b55c30 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -160,13 +160,12 @@ static int pi3usb30532_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int pi3usb30532_remove(struct i2c_client *client)
> +static void pi3usb30532_remove(struct i2c_client *client)
>  {
>  	struct pi3usb30532 *pi = i2c_get_clientdata(client);
>  
>  	typec_mux_unregister(pi->mux);
>  	typec_switch_unregister(pi->sw);
> -	return 0;
>  }
>  
>  static const struct i2c_device_id pi3usb30532_table[] = {
> diff --git a/drivers/usb/typec/rt1719.c b/drivers/usb/typec/rt1719.c
> index f1b698edd7eb..ea8b700b0ceb 100644
> --- a/drivers/usb/typec/rt1719.c
> +++ b/drivers/usb/typec/rt1719.c
> @@ -930,14 +930,12 @@ static int rt1719_probe(struct i2c_client *i2c)
>  	return ret;
>  }
>  
> -static int rt1719_remove(struct i2c_client *i2c)
> +static void rt1719_remove(struct i2c_client *i2c)
>  {
>  	struct rt1719_data *data = i2c_get_clientdata(i2c);
>  
>  	typec_unregister_port(data->port);
>  	usb_role_switch_put(data->role_sw);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id __maybe_unused rt1719_device_table[] = {
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index e7745d1c2a5c..8638f1d39896 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -801,7 +801,7 @@ static int stusb160x_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -static int stusb160x_remove(struct i2c_client *client)
> +static void stusb160x_remove(struct i2c_client *client)
>  {
>  	struct stusb160x *chip = i2c_get_clientdata(client);
>  
> @@ -823,8 +823,6 @@ static int stusb160x_remove(struct i2c_client *client)
>  
>  	if (chip->main_supply)
>  		regulator_disable(chip->main_supply);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused stusb160x_suspend(struct device *dev)
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 96c55eaf3f80..5e9348f28d50 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1771,7 +1771,7 @@ static int fusb302_probe(struct i2c_client *client,
>  	return ret;
>  }
>  
> -static int fusb302_remove(struct i2c_client *client)
> +static void fusb302_remove(struct i2c_client *client)
>  {
>  	struct fusb302_chip *chip = i2c_get_clientdata(client);
>  
> @@ -1783,8 +1783,6 @@ static int fusb302_remove(struct i2c_client *client)
>  	fwnode_handle_put(chip->tcpc_dev.fwnode);
>  	destroy_workqueue(chip->wq);
>  	fusb302_debugfs_exit(chip);
> -
> -	return 0;
>  }
>  
>  static int fusb302_pm_suspend(struct device *dev)
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index f33e08eb7670..c48fca60bb06 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -869,7 +869,7 @@ static int tcpci_probe(struct i2c_client *client,
>  	return 0;
>  }
>  
> -static int tcpci_remove(struct i2c_client *client)
> +static void tcpci_remove(struct i2c_client *client)
>  {
>  	struct tcpci_chip *chip = i2c_get_clientdata(client);
>  	int err;
> @@ -880,8 +880,6 @@ static int tcpci_remove(struct i2c_client *client)
>  		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
>  
>  	tcpci_unregister_port(chip->tcpci);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id tcpci_id[] = {
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index df2505570f07..a11be5754128 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -493,14 +493,12 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
>  	return ret;
>  }
>  
> -static int max_tcpci_remove(struct i2c_client *client)
> +static void max_tcpci_remove(struct i2c_client *client)
>  {
>  	struct max_tcpci_chip *chip = i2c_get_clientdata(client);
>  
>  	if (!IS_ERR_OR_NULL(chip->tcpci))
>  		tcpci_unregister_port(chip->tcpci);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id max_tcpci_id[] = {
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index b56a0880a044..9ad4924b4ba7 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -263,12 +263,11 @@ static int rt1711h_probe(struct i2c_client *client,
>  	return 0;
>  }
>  
> -static int rt1711h_remove(struct i2c_client *client)
> +static void rt1711h_remove(struct i2c_client *client)
>  {
>  	struct rt1711h_chip *chip = i2c_get_clientdata(client);
>  
>  	tcpci_unregister_port(chip->tcpci);
> -	return 0;
>  }
>  
>  static const struct i2c_device_id rt1711h_id[] = {
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index dfbba5ae9487..b637e8b378b3 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -857,15 +857,13 @@ static int tps6598x_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -static int tps6598x_remove(struct i2c_client *client)
> +static void tps6598x_remove(struct i2c_client *client)
>  {
>  	struct tps6598x *tps = i2c_get_clientdata(client);
>  
>  	tps6598x_disconnect(tps, 0);
>  	typec_unregister_port(tps->port);
>  	usb_role_switch_put(tps->role_sw);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id tps6598x_of_match[] = {
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 6db7c8ddd51c..920b7e743f56 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1398,7 +1398,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  	return status;
>  }
>  
> -static int ucsi_ccg_remove(struct i2c_client *client)
> +static void ucsi_ccg_remove(struct i2c_client *client)
>  {
>  	struct ucsi_ccg *uc = i2c_get_clientdata(client);
>  
> @@ -1408,8 +1408,6 @@ static int ucsi_ccg_remove(struct i2c_client *client)
>  	ucsi_unregister(uc->ucsi);
>  	ucsi_destroy(uc->ucsi);
>  	free_irq(uc->irq, uc);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id ucsi_ccg_device_id[] = {
> diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
> index e63509f8b01e..3cc7a15ecbd3 100644
> --- a/drivers/usb/typec/wusb3801.c
> +++ b/drivers/usb/typec/wusb3801.c
> @@ -399,7 +399,7 @@ static int wusb3801_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -static int wusb3801_remove(struct i2c_client *client)
> +static void wusb3801_remove(struct i2c_client *client)
>  {
>  	struct wusb3801 *wusb3801 = i2c_get_clientdata(client);
>  
> @@ -411,8 +411,6 @@ static int wusb3801_remove(struct i2c_client *client)
>  
>  	if (wusb3801->vbus_on)
>  		regulator_disable(wusb3801->vbus_supply);
> -
> -	return 0;
>  }

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki
