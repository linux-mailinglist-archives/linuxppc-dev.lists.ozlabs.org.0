Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA73FD774
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 08:59:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DrMk1PSMzF6kq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 18:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="BjHqHXiG"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DrKb5Tx0zF5k0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 18:57:07 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id r14so656540lff.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 23:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zLHtq3yfrffU9o2nF0X7zoTmdgeT+a2HOFrUz+0J25Q=;
 b=BjHqHXiGMgpJVRBuo+lq+sEes/L+3Pgkfq4t22+sAm3ZkEfNZJjCgNxK0Lq2+SC82z
 q4IiSNGldEN1uq+0oO7YsbEQj/jG8NjDGr2TQGUPclpVxjdT+bLba2JJiXE7NvHKORtO
 xVd6o/D+7FumLWsNsyWQxMok7BRgJFk6bpv/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zLHtq3yfrffU9o2nF0X7zoTmdgeT+a2HOFrUz+0J25Q=;
 b=LfPBnJNsjXLU7AWkplsPQRvEBJKz4XB2grH5tDqcm/Bi+3XodLJ8B7ldYhMkV7/wN8
 r8TXVw8NZoUjLp9btWHLR1+zGT66LsLG9Vzy0hKJuzni+LvB9IcuNX0d6AZ1tfqHKY+N
 d84IUxS3l6OmrfNaNutBJMaEwRfdhA5bnXIO14P3n+jGMj93kx5OxG/dMX6eEva7qX63
 QNNYLvZAz5dJn2V+0g8DntcGtH0SmoVwxfrIREhZi/EvV+3SefbPdbuLP2wRYJK0oXFs
 xh3jcvhiRYNrBy1CjgXuaPG6w7Os6Lp+jKZg6XVMhQ4riBuogIPfVS39A0xWn6T+Sb/O
 B9Mg==
X-Gm-Message-State: APjAAAXZ/26vTyhF846wW8Naq843y5A2slMd2L/MJUqLGMtIZuIokEkM
 roJiDSyFnCjFxHXoucx7WVQanQ==
X-Google-Smtp-Source: APXvYqzS4mGv0Td6lhMx6P1LJw0rbb74jK3Vo5agUi9HiQO2P985F1jTJV8/p7ydSoDXjafwq0X1nQ==
X-Received: by 2002:ac2:5236:: with SMTP id i22mr10287608lfl.19.1573804623889; 
 Thu, 14 Nov 2019 23:57:03 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z21sm4888837lfg.0.2019.11.14.23.57.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 23:57:03 -0800 (PST)
Subject: Re: [PATCH v4 32/47] serial: ucc_uart: use of_property_read_u32() in
 ucc_uart_probe()
To: Timur Tabi <timur@kernel.org>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-33-linux@rasmusvillemoes.dk>
 <CAOZdJXVpDSk2AWT7pYjrsk5HUmAeosCNf8zWX1CEEtZshAh9Sw@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f584ea71-694f-3d3a-7228-9232531e3918@rasmusvillemoes.dk>
Date: Fri, 15 Nov 2019 08:57:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOZdJXVpDSk2AWT7pYjrsk5HUmAeosCNf8zWX1CEEtZshAh9Sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 15/11/2019 05.25, Timur Tabi wrote:
> On Fri, Nov 8, 2019 at 7:03 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> +       if (of_property_read_u32(np, "cell-index", &val) &&
>> +           of_property_read_u32(np, "device-id", &val)) {
> 
> I know that this is technically correct, but it's obfuscated IMHO.
> 'val' is set correctly only when of_property_read_u32(...) is "false",
> which is doubly-weird because of_property_read_u32(...) doesn't
> actually return a boolean.
> 
> I would rather you break this into two if-statements like the original code.
> 

Sure, I can do that.
