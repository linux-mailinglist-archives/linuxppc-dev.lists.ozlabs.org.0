Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EE13D1F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:14:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynp26DJ2zDqVm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:14:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynLJ3xV1zDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:54:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=f1wgcENG; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynLH5qmNz8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:54:15 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynLH5KRmz9sR4; Thu, 16 Jan 2020 12:54:15 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=f1wgcENG; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynLH20Rvz9sPW
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:54:15 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id c24so6828954qtp.5
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZlsu2C+W6LjjPjR8YKRaFSa2tjelbEupqpMJ4R6VMY=;
 b=f1wgcENG4xBgclBryDkiYUt77py0EGe7L0/wjM48f0ERWZ+vomktQIAFgk98wp3d4g
 uMPuG7QvJ/jZoS2FHF10jXiaKV297tV4K3sVZFVcaf8E8A15Bq8J9iT5j/5cgGLXhKjB
 H1CFmR4+xRA5ikqPjHiAzRcAr6bp0DJSeFVwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZlsu2C+W6LjjPjR8YKRaFSa2tjelbEupqpMJ4R6VMY=;
 b=ANzkIAMzu4IzTiwp4ckTwmz3OOtX770tpQ1RQ0eN/fv7juux40mbYIuZCTI2LQax/G
 BKkpLSdsB7qdzJNWRoCOiU5VmczLZtjREhHn5m9YraevYOAE6uOnIXpHgsBBD+x9YYMQ
 fziLa7ok6wcIsgUPMeNC45OKDbf3bW7+zhxnlm5IDImEjsj6y6uE/sVoXI2UkDef7CwE
 9mL+RovKxwBHYPxeec0MvR+oYEhVArg0WJKvHvwP0XUxZ6Onjg5niZiY48ZypKEbWw5R
 uejxX0aPSRA/uUf6EHS9Cwil7FiLY6iNrDXQsDYpXALLllu0L250zicj4RjswNJ6nVa8
 j/qw==
X-Gm-Message-State: APjAAAX3RpZM2SYO69SlvegprmknTWg4klXI6+TQEJSk8rJDx7Wgb2gw
 5nrvQZssFtepa2ubC+IJbQbRnR4W/PPlj4gQXN1xzQ==
X-Google-Smtp-Source: APXvYqwIuLDy06JwUcEdcHs+FJwublM31SK2F/8Rw82SQOO2M+5omH3+XAXl+xLWbAOQ630JybTECTZ25YDKuijaHlE=
X-Received: by 2002:ac8:3467:: with SMTP id v36mr196816qtb.255.1579139653045; 
 Wed, 15 Jan 2020 17:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-2-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-2-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:54:01 +0000
Message-ID: <CACPK8XeF91N5MRcbmNJm3TMu+MGjn5GAVX2ffvDyP0sdnVzSuw@mail.gmail.com>
Subject: Re: [PATCH 2/9] powerpc/configs: NET_CADENCE became NET_VENDOR_CADENCE
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 at 01:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The NET_CADENCE symbol was renamed to NET_VENDOR_CADENCE, so we don't
> need to disable the former, see commit 0df5f81c481e ("net: ethernet:
> Add missing VENDOR to Cadence and Packet Engines symbols").
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
