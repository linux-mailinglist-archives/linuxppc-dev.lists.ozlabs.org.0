Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0462A0437
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:35:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN0cB5GpyzDqBm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 22:35:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=idryomov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=frLzaxmw; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN0543XtKzDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 22:12:00 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id n5so6135718ile.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZV0ThIiPZfP1J2R9nyVt8QkuejC8cSVT80sCSgcOxz0=;
 b=frLzaxmwhGcVkXjbtKiS94LkaEgTCIqs5lcLgp7qud2oXWRlC0QKI3bu8As+Qe/3+/
 YswYlbhwudFEROgXLO0RidFvUATOBI7jk1lDLjY+whOmmq9Wr466RzZ5uuDqGV3FbAQG
 l5ts/Dwn0MzkC2R6n6o7hulkK9e/L4r9462cvEbQnmU+Vp4izCFhUSz5rYUeyvvecom/
 skR+qlhyOuiRDMt/6fAEhtpRAkvua7TqwnEmsCShc8NHMqgmHLM3NnLpiiyehNei+OWa
 WZsv0NfFfxPPWvhOiranGCdFjTSZKT7qkP3ITLJ8wRX/70+d0XR4v07v323ob3Nx/pYz
 m4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZV0ThIiPZfP1J2R9nyVt8QkuejC8cSVT80sCSgcOxz0=;
 b=LAMaXnIu/JKAp1WLzSeEMgP+WZT1HzQnOaR0lFAgjhXh/RmqZYM79aJtbGWdGQsx3D
 Bu5gMdW/4fbBqtPsPbBwEvTJV17BBxN9Yb9XTQ+dzwdrHm9kXDF6ALzyhnoWARMxJH3d
 EbEWWTWCIvuKAQ6T6+aeyxX383jujqNYhvW8R1Lpe/8ZoQ6KeO/myoYz7E49nNRkn+vh
 WAVuxakpJx+vgZGkekncME88mhLHdxPk6Xy+qfyE/+ZK3x23zRJpw45H6cet0BY4uDHT
 ycm/OvYz3ZVSFtFMjM0sBs3qY7uqTVZbtu1kb31yrTxW95XwBiBf+jKdJjUWH69+FshE
 PfIA==
X-Gm-Message-State: AOAM533D+Ez7YNHDfinJhabVJgNY5Rw+Rk9ZbagFqR4gHxAOH//aifuF
 hjsNpRFdk2HIIgi3ihW434blFvAPbjkrL+nfbtc=
X-Google-Smtp-Source: ABdhPJzTddVFvGcRMfdnfgtj3RhHYeI8lzSbPQsDbDZuu+e8Z0f5KxtsaoxhCUlFTZHA3Ubj6PmYhDwWjpnLL1nJZe4=
X-Received: by 2002:a92:4442:: with SMTP id a2mr1368452ilm.220.1604056315371; 
 Fri, 30 Oct 2020 04:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 30 Oct 2020 12:11:54 +0100
Message-ID: <CAOi1vP-gKLw7shFy5rUeH6Z14hr_B9fW0epaRyuw45tg4EuCcQ@mail.gmail.com>
Subject: Re: [PATCH v2 31/39] docs: ABI: cleanup several ABI documents
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 30 Oct 2020 22:32:33 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Chen <peter.chen@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Christian Gromm <christian.gromm@microchip.com>,
 Ceph Development <ceph-devel@vger.kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-acpi@vger.kernel.org,
 Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Wu Hao <hao.wu@intel.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Saravana Kannan <saravanak@google.com>, Anton Vorontsov <anton@enomsg.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-media@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Oded Gabbay <oded.gabbay@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 linux-gpio@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 linux-f2fs-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonas Meurer <jonas@freesources.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Mark Gross <mgross@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Kees Cook <keescook@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Roman Sudarikov <roman.sudarikov@linux.intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-i3c@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 Johan Hovold <johan@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, linux-iio@vger.kernel.org,
 Asutosh Das <asutoshd@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30, 2020 at 8:41 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There are some ABI documents that, while they don't generate
> any warnings, they have issues when parsed by get_abi.pl script
> on its output result.
>
> Address them, in order to provide a clean output.
>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO
> Reviewed-by: Tom Rix <trix@redhat.com> # for fpga-manager
> Reviewed-By: Kajol Jain<kjain@linux.ibm.com> # for sysfs-bus-event_source-devices-hv_gpci and sysfs-bus-event_source-devices-hv_24x7
> Acked-by: Oded Gabbay <oded.gabbay@gmail.com> # for Habanalabs
> Acked-by: Vaibhav Jain <vaibhav@linux.ibm.com> # for sysfs-bus-papr-pmem
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> [...]
>
>  Documentation/ABI/testing/sysfs-bus-rbd       |  37 ++-

Acked-by: Ilya Dryomov <idryomov@gmail.com> # for rbd

Thanks,

                Ilya
