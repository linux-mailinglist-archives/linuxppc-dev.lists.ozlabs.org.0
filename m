Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD381D59F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:26:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nz0y3rqNzDqMf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:26:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=soleen.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=pasha.tatashin@soleen.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256
 header.s=google header.b=DYjN1UQ+; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NyqH3DDgzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:18:02 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id g9so3103050edw.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbFsGFMIlvy1kKOGqgavt+ubA29TnTVOTBRv6vIQjH0=;
 b=DYjN1UQ+2UifVP6w0ZHdAS+uaK/GP/9FOFhOPYeVr635TTaqdqu+hbJhqccicAI5lx
 Cbo4FdRrTW0jq/ekvklHVpsOkZBAOYDwp+KcZCiioXOsJ7nN1THWpRDJ8kkCV5qWtm0g
 AF/+1417vIKTX3DYRaoeOUt3wKN4+Ft836iqIjoOgl+X6UJGNj2GLPekJh8DuKYjf3UE
 AXjUmpSfyNeiq8S37ot0NrUeGh3+vXZJaYGwsPNrz9mVCSVhK6B96CRah6XKUOsEhypz
 ryKvBFjGDOrNVUKj4PYHDUpHNw82luHfzbGnyDdIGkha6PdBAja9wmcuYdT0B/+oY+TA
 MbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbFsGFMIlvy1kKOGqgavt+ubA29TnTVOTBRv6vIQjH0=;
 b=NVY1XbHNGgAC6o+MkhEG+6mn+Zjbq+sP2/AFa1LJ1XO0eEN5fkJDk70sRfECFi/nJK
 ZZeMRe9mP7Ies5fN+a19ysQi4RYObhSKGmSMqJ4L4Y4IA0fNsDZvea2PbcD7Na3amRmV
 aujrOn8c5yGAZEhhBD23ilL7R4HgSr1GB0NPz+8KFHfv/jO//h6oeCXa2T6kaJ+pCmnL
 DX3x+vHhQ4p3QY66fUOtO5rD1RVjmxAgFOKyt5udlpLTD92Rb89WmcANL2BGnb83Kb1A
 WVwZNJEQe3iMAJMErz46fQe9Q2P9tyB26IJLin69XMlPTU+FEbXrf6fC5ZBAJRgd+DtY
 9hbQ==
X-Gm-Message-State: AOAM532Q9xCLAr81oarUoUPCMtgoaTSA6V1kQ87HpYq4K4LjW93KPahM
 dqAG/KfnbJmcqZ+R5UG2hgtxT9l3yX1Ll42k8eexSw==
X-Google-Smtp-Source: ABdhPJz0Ek3DDmLsyu6vepzg7IcDPqIXlEvChPtaCxV8HF3LZLhlke8gwyZn2f1RjvDzPYken2umNdX2JOgQpllNx+E=
X-Received: by 2002:a50:ee04:: with SMTP id g4mr4273534eds.221.1589570278060; 
 Fri, 15 May 2020 12:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-2-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-2-keescook@chromium.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 15 May 2020 15:17:22 -0400
Message-ID: <CA+CK2bBV2vT-4NCsBnbuKM7YtDM=y9tV3mOcb+Mh+mW=YxF5Lg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] printk: Collapse shutdown types into a single dump
 reason
To: Kees Cook <keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 15, 2020 at 2:44 PM Kees Cook <keescook@chromium.org> wrote:
>
> To turn the KMSG_DUMP_* reasons into a more ordered list, collapse
> the redundant KMSG_DUMP_(RESTART|HALT|POWEROFF) reasons into
> KMSG_DUMP_SHUTDOWN. The current users already don't meaningfully
> distinguish between them, so there's no need to, as discussed here:
> https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Maybe it makes sense to mention in the commit log that for all three
merged cases there is a pr_emerg() message logged right before the
kmsg_dump(), thus the reason is distinguishable from the dmesg log
itself.

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
