Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3123FF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 20:07:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4576LV1RTPzDqNG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 04:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rere.qmqm.pl
 (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rere.qmqm.pl
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="ZDYqeYDG";
 dkim-atps=neutral
X-Greylist: delayed 596 seconds by postgrey-1.36 at bilbo;
 Tue, 21 May 2019 04:06:17 AEST
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4576K55gwBzDqCs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 04:06:17 +1000 (AEST)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45763m0MdZz9t;
 Mon, 20 May 2019 19:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1558374886; bh=hXE7AHhk3hVcTSSePlYKB9Bnza+wPxYvgvUVa4FLAsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDYqeYDGoE2mL3x/+uC0/QalyZqGXXaVmCUQpPqRVyY4+7M0TsipHp97zwKXyKVIy
 GbYocBIkcKAONIMVifes8muu0oUVHPBtqkfkhX2a6oQ+DzJ+mN7UgB8hLy0Kdq5zKp
 MRJwLUWypLRdkoa61oo2R0OB9FI4eoR42+MLq5KOOAhj3bHYYBxJSWALmKUUqLAKqb
 jvdTEp1YKmsGAaw2IbVWqtQvUCTUO5qMndwhtXTVeHRnaz5tRIXIGufEBAXC17fZIF
 YKdv3eoHpCgLsvYhzvEbUFoO8tE2KTbKffBb+hTWdrOdIQVVjcOqjCKEpcfcskAERk
 5COH+wX22iT7g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 20 May 2019 19:55:55 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] misc: remove redundant 'default n' from Kconfig-s
Message-ID: <20190520175555.GA5429@qmqm.qmqm.pl>
References: <CGME20190520141047eucas1p2c6006d1ecfc3eb287b6b33d131f66180@eucas1p2.samsung.com>
 <1ab818ae-4d9f-d17a-f11f-7caaa5bf98bc@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ab818ae-4d9f-d17a-f11f-7caaa5bf98bc@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Eric Piel <eric.piel@tremplin-utc.net>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Haverkamp <haver@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 04:10:46PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 'default n' is the default value for any bool or tristate Kconfig
> setting so there is no need to write it explicitly.
> 
> Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
> is not set' for visible symbols") the Kconfig behavior is the same
> regardless of 'default n' being present or not:
> 
>     ...
>     One side effect of (and the main motivation for) this change is making
>     the following two definitions behave exactly the same:
>     
>         config FOO
>                 bool
>     
>         config FOO
>                 bool
>                 default n
>     
>     With this change, neither of these will generate a
>     '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
>     That might make it clearer to people that a bare 'default n' is
>     redundant.
>     ...
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
[...]
>  drivers/misc/cb710/Kconfig        |    1 -

Acked-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
