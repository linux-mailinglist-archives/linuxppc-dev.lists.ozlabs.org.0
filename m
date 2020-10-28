Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0EE29D263
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:17:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1cf4Ty8zDqwf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=richardcochran@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=InpLHLru; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLwty3chJzDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 04:44:36 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id j18so77234pfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GeMX+k14VhxeG76k1/qSlgb4+cXieu72K4e08pwdt1o=;
 b=InpLHLruF700Q395/JUSDPFi5ct3Q0NFGhIrDU/UmIhGdDThKH8GKD+cw6T2N6QNcD
 PUvF0K87ShFDKaAjJCfvpeMCAaEiJ8eHb269GNLlCVUSVFBQarvkQDFEeK2v65rPe7+J
 tC/1aFfwnYWg9j8u/6Ud/Yyen1uhouxurM0nLvzz3MYFdzPpthJUWusVU6lftQoy21uA
 qiW9X1ZTMFe3cniRtPQ+TCgotIme378DGRcyAXvYYZgBHvV1ur7fGjNBhSILa0vbkqSM
 tRUkeNha3rVBlOMkNme6QRGiAF7X/US6S2FlZ9tPWrsV95ioL0sZyvBU99MP8xfC1Ema
 woPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GeMX+k14VhxeG76k1/qSlgb4+cXieu72K4e08pwdt1o=;
 b=ImU5ziDdFAVxlLh22abIEcMPxj2wPsivlL5dO0+AUpWwCkLGH+abnLfxYhzHHu2WAj
 3xwIjIKyrEbWHuZa6UOChg+CxZP0gjUfxliQ91FXOLQKp1tkWFe6euzfGY9xCTnCTXe0
 doSrkt6a1x+oSV5FKpeS3gFeIci0zQaiYLVsLkKTf7pwTRN7DAKAbTyH+x4I1Sy2c9UF
 5WhDiGyBdL5dqQe60TwSAt7xYtt/jqdjJZ4loBIGYN1OU9d5m9naBxG8xUi8EnStkjTE
 RRslgihDbThY1MzQSYoLzTgcDryxFBI9uD9QFLc04YYKjDqkIPCOoMLqzYf+pgIaWzoJ
 aMuQ==
X-Gm-Message-State: AOAM533Ul4hlqC8o+Llx8iz3TC5fzk6DTnxB1/Tu0nW/8eewpjdZV+4f
 LFEJ9E+bAMWJ08NZ+3xwb7M=
X-Google-Smtp-Source: ABdhPJw+P7PZ1ANDYILo79Hsg7TsK8M0hrdd6+wFNAfXxYnBAlE0Wr2vQTH+qAkmHlbh1+XaD9f7GA==
X-Received: by 2002:a63:78c3:: with SMTP id t186mr490857pgc.12.1603907075050; 
 Wed, 28 Oct 2020 10:44:35 -0700 (PDT)
Received: from hoboy.vegasvil.org (c-73-241-114-122.hsd1.ca.comcast.net.
 [73.241.114.122])
 by smtp.gmail.com with ESMTPSA id d26sm224049pfo.82.2020.10.28.10.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 10:44:34 -0700 (PDT)
Date: Wed, 28 Oct 2020 10:44:27 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 20/33] docs: ABI: testing: make the files compatible with
 ReST output
Message-ID: <20201028174427.GE9364@hoboy.vegasvil.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:04:12 +1100
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Petr Mladek <pmladek@suse.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 Oleh Kravchenko <oleg@kaa.org.ua>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-acpi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Len Brown <lenb@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Baolin Wang <baolin.wang7@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Dan Murphy <dmurphy@ti.com>, Orson Zhai <orsonzhai@gmail.com>,
 Philippe Bergheaud <felix@linux.ibm.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Konstantin Khlebnikov <koct9i@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 03:23:18PM +0100, Mauro Carvalho Chehab wrote:

> diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> index aa39f8d7bcdf..d0893dad3f38 100644
> --- a/Documentation/ABI/testing/sysfs-uevent
> +++ b/Documentation/ABI/testing/sysfs-uevent
> @@ -19,7 +19,8 @@ Description:
>                  a transaction identifier so it's possible to use the same UUID
>                  value for one or more synthetic uevents in which case we
>                  logically group these uevents together for any userspace
> -                listeners. The UUID value appears in uevent as
> +                listeners. The UUID value appears in uevent as:

I know almost nothing about Sphinx, but why have one colon here ^^^ and ...

> +
>                  "SYNTH_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" environment
>                  variable.
>  
> @@ -30,18 +31,19 @@ Description:
>                  It's possible to define zero or more pairs - each pair is then
>                  delimited by a space character ' '. Each pair appears in
>                  synthetic uevent as "SYNTH_ARG_KEY=VALUE". That means the KEY
> -                name gains "SYNTH_ARG_" prefix to avoid possible collisions
> +                name gains `SYNTH_ARG_` prefix to avoid possible collisions
>                  with existing variables.
>  
> -                Example of valid sequence written to the uevent file:
> +                Example of valid sequence written to the uevent file::

... two here?

Thanks,
Richard
