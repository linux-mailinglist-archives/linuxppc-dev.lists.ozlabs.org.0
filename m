Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334B1B522C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 03:56:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4970ly51hxzDr0X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 11:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050::465:202;
 helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=Dxu2Tos7; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=JZjiB4RC; 
 dkim-atps=neutral
Received: from mout-p-202.mailbox.org (unknown [IPv6:2001:67c:2050::465:202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4970jy4BRwzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:54:57 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 496tL34ZJyzQlHY;
 Wed, 22 Apr 2020 23:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :references:in-reply-to:message-id:subject:subject:from:from
 :date:date:received; s=mail20150812; t=1587589639; bh=4C1ZcPFlNo
 MYHc6s+skkSb0gvvRJHnGvtMmmxQe7rNo=; b=Dxu2Tos7jNms31cX2a4dFFfjeA
 zdXu9yM7UHjoaNHSmiVlvn4yzXK/PY6QsBam2+miWBZcJH/9WzHERi/3ARzXpF1t
 D9hrDJoiUhLswwV4MgFXwUAj7+5y276AGrbWe/7F88VGXDs9w6CzDZ5Ka/aLS4Cy
 E7OzDcKr6qoioHX/RHrh/S0vx8MOy90clHG9rqYm1T32g+VDL2vbLoRT/Xo/MwJV
 Xb8RzuioO0xCtPer7w1nXf1Q3eokbbhkITg/sg9ALCGuE/6hl1lWG5yCIxmhvfiY
 OREMCNcQ+drl+08+GOrRDW76Vg1bl0tJkg+hRkmzfLqP+4ZuzEd3sba8bgXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1587589641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGGpp/0boXM4fgRdSDqWdoU87OHSgjQHu1ui442p74A=;
 b=JZjiB4RCJ/mP9MwbxgiQiMxM5m40yqrcy5yEuMIbVOhSwZ5MvbU7qrYFBDaTOb3yf3L9un
 Xj3E5+dQ5NlHY30RgibvyOVkX4PK/gjQV4CAYSmDVLZsPURplH3DSNvTWI//FNeLPBZsoJ
 PoHDoiV7WEeM9xoAiW79HD5sRSCZTDgm3f7ksk0UpgnLXIt0OT0h10MStYA06Gvw01s8wH
 +TjY3YQJXajEP04g/+HbLXT91B4kqE+HD3OiR7A8nUgVpRLCek0Jl0Mhyyt4qOe7DtAlao
 qfA5d4fVFfVT+xYFvYhs7mVUfFHrRYIj3QP5lovTXx+AXUTQSX/u3R+UrWHXrQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 4-OrVoBX8US2; Wed, 22 Apr 2020 23:07:19 +0200 (CEST)
Date: Wed, 22 Apr 2020 23:07:14 +0200
From: "Erhard F." <erhard_f@mailbox.org>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: powermac: Simplify reading the "reg" and
 "i2c-address" property
Message-ID: <20200422230709.19a81ef9@supah>
In-Reply-To: <20200421093712.GA1241@ninjato>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
 <20200415131916.23555-1-aishwaryarj100@gmail.com>
 <20200421093712.GA1241@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C31D01782
X-Rspamd-Score: -5.79 / 15.00 / 15.00
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Aishwarya R <aishwaryarj100@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Apr 2020 11:37:13 +0200
Wolfram Sang <wsa@the-dreams.de> wrote:

> On Wed, Apr 15, 2020 at 06:49:14PM +0530, Aishwarya R wrote:
> > >> Use of_property_read_u32 to read the "reg" and "i2c-address" property
> > >> instead of using of_get_property to check the return values.
> > >>
> > >> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>  
> >   
> > > This is quite a fragile driver. Have you tested it on HW?  
> > 
> > This change is not tested with the Hardware.
> > But of_property_read_u32 is better here than generic of_get_property.
> > This make sure that value read properly independent of system endianess.  
> 
> This driver is only used on PPC_BE. And it is *very* fragile. The gain
> is not enough for me to accept it without testing. Maybe Erhard (CCed)
> is interested. If not, you may find someone on the ppc lists.
> 

I applied the patch on top of kernel 5.6.6 and tested it on a PowerMac G4 3,6 DP and a PowerMac G5 11,2. Both machines run without anything suspicious going on. dmesg | grep i2c looks the same with patch and without patch.

Tested-by: Erhard Furtner <erhard_f@mailbox.org>
