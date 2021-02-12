Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66E319A8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 08:35:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcQJs0wgNzDwx5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 18:35:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=nwza=ho=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=HXxvvzoL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcQHB0J1YzDwrR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 18:34:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F6E64DDF;
 Fri, 12 Feb 2021 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613115251;
 bh=neLigVsdoN+CYxyJjxX/qAVzIuWLkdZyDMtjMwYqrLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HXxvvzoLkjPDeR3JvcBQ0yM6umQwZkmsCLbD2ensoMiDSwJ12mr5vWKrB0DrZiHW7
 Gekvt4dNU/S+p5AIGSg4dt+0WYDyTcu/6XVXII5HxZO1gqLk/3yDI3Wlulmpn0zOJp
 7rgsu6cSkxMG72w51fu99lYoEdiG5ZacmY648UG0=
Date: Fri, 12 Feb 2021 08:34:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] of: of_device.h cleanups
Message-ID: <YCYvcUNiPoG/ipyj@kroah.com>
References: <20210211232745.1498137-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211232745.1498137-1-robh@kernel.org>
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
Cc: cocci@systeme.lip6.fr, devicetree@vger.kernel.org,
 Michal Marek <michal.lkml@markovi.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Gilles Muller <Gilles.Muller@inria.fr>,
 linux-usb@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 11, 2021 at 05:27:43PM -0600, Rob Herring wrote:
> This is a couple of cleanups for of_device.h. They fell out from my
> attempt at decoupling of_device.h and of_platform.h which is a mess
> and I haven't finished, but there's no reason to wait on these.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
