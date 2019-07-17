Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 791516BFA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 18:32:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pjTz5WhnzDqR5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 02:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 974 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jul 2019 02:30:09 AEST
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pjRP6DTtzDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 02:30:06 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BBF80605C121F65CC65C;
 Thu, 18 Jul 2019 00:13:46 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 18 Jul 2019
 00:13:42 +0800
Date: Wed, 17 Jul 2019 17:13:20 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v4 13/15] docs: ABI: testing: make the files compatible
 with ReST output
Message-ID: <20190717171320.000035c2@huawei.com>
In-Reply-To: <88d15fa38167e3f2e73e65e1c1a1f39bca0267b4.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
 <88d15fa38167e3f2e73e65e1c1a1f39bca0267b4.1563365880.git.mchehab+samsung@kernel.org>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-mm@kvack.org, netdev@vger.kernel.org, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, Guenter Roeck <groeck@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-acpi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-pm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut
 Knaack <knaack.h@gmx.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Jul 2019 09:28:17 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Some files over there won't parse well by Sphinx.
> 
> Fix them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Hi Mauro,

Does feel like this one should perhaps have been broken up a touch!

For the IIO ones I've eyeballed it rather than testing the results

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


