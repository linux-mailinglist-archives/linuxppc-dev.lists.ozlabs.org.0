Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A6FD3A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:28:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DlhV6wYPzF7cD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="KRpj0jxq"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dlfd5VM9zF5Rg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:26:33 +1100 (AEDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A1FB2072B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 04:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573791990;
 bh=9wOq687Qi/2lX8IlVmx3X62wxNLXabR/kcOYgP+5Zic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KRpj0jxqSegt9Nw4hWezOFc+3piXWWS0uzU6orlkh5W/H0zEhswSnT8XaLD7HuLtl
 7oHNud3SfJmDxTgZ33qFavoPYuHMwP59ZF93vdykTnucwKJyjd3s/0RUwBlDBMwson
 RMC9Epl151y4HMRqHoOmLSH2j+LfU+ftqc9i7S7w=
Received: by mail-qk1-f171.google.com with SMTP id m16so7084198qki.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:26:30 -0800 (PST)
X-Gm-Message-State: APjAAAXLGaMIRlhDDaB+WSE9lPVKanlrL7qiZg6+vFLDaAuexu7rWNXw
 2RqGIUqST4/eNMw4nnVGGH70IbDVxKde4yrl8Ns=
X-Google-Smtp-Source: APXvYqyLFzHjZ7tEQMeLkCQSkpPg0rZdqFl6WRIPEi5xIjuml+zSKU9pde3u+lplCRandR9s/b1zLnOoGmwvymczkds=
X-Received: by 2002:a37:9d44:: with SMTP id g65mr10614078qke.302.1573791989555; 
 Thu, 14 Nov 2019 20:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-33-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-33-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Thu, 14 Nov 2019 22:25:52 -0600
X-Gmail-Original-Message-ID: <CAOZdJXVpDSk2AWT7pYjrsk5HUmAeosCNf8zWX1CEEtZshAh9Sw@mail.gmail.com>
Message-ID: <CAOZdJXVpDSk2AWT7pYjrsk5HUmAeosCNf8zWX1CEEtZshAh9Sw@mail.gmail.com>
Subject: Re: [PATCH v4 32/47] serial: ucc_uart: use of_property_read_u32() in
 ucc_uart_probe()
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:03 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> +       if (of_property_read_u32(np, "cell-index", &val) &&
> +           of_property_read_u32(np, "device-id", &val)) {

I know that this is technically correct, but it's obfuscated IMHO.
'val' is set correctly only when of_property_read_u32(...) is "false",
which is doubly-weird because of_property_read_u32(...) doesn't
actually return a boolean.

I would rather you break this into two if-statements like the original code.
