Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129110A471
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 20:25:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mv4r1FQdzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 06:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mv2l5MKBzDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 06:23:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Mv2k4WvFz8t2S
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 06:23:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Mv2k4Cg5z9sPj; Wed, 27 Nov 2019 06:23:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.194;
 helo=mail-il1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Mv2k0y2Lz9sPZ
 for <linuxppc-dev@ozlabs.org>; Wed, 27 Nov 2019 06:23:41 +1100 (AEDT)
Received: by mail-il1-f194.google.com with SMTP id g12so9258874ild.2
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 11:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5HQvc+ebgeUpvGjHDXPpgN7hbbmKJO3hU3E3sjzKKD4=;
 b=NnSvx3449OrkrMNnfVZcQ+KjvqQ5e57yBHEngLZdMQrxPLBs7cfTPBgYPK3r7fts/n
 VN3cMJrP1DSDNI/UbVeMC0+3wptmmX7GXWj59O5aLt7lTGWkjeuz7SdAjKIgw/EEZ8J3
 hQF2Q3O/EbjlkT+3Jg/RU8pxYoAeqtF+VwojXbTHzwiynJ1N0USZfQScS6vDxeNb/TAQ
 VBvV2W5HotkLNCjkGVRNr6IsPuYEFe5SuMdrQZ2TvrtBQGEQ2Y5iyToHBU5Z3lfMujP0
 xRgVQKk5zhnZy/lOlF51qbs+UpJXOSGd17Vpv8c+yUTIcuiHnOv/Qeqohs3jB3N1IBn7
 2SjA==
X-Gm-Message-State: APjAAAVg3mXLWp2M/DEK28H3BrHl6INvBZwnmUub8jxWHdbctUvCKJ6J
 V9EVkd8iU/eKU53ZOxlIFQ==
X-Google-Smtp-Source: APXvYqxLi2BPHhib7tuA5K/dBdXW6V5zjrGNxJcK95S9arb/wV5mxmiHCV0Wk/se2VVXlbX81tL0FA==
X-Received: by 2002:a92:6406:: with SMTP id y6mr41484371ilb.70.1574796219273; 
 Tue, 26 Nov 2019 11:23:39 -0800 (PST)
Received: from localhost ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q9sm2846876iod.79.2019.11.26.11.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 11:23:38 -0800 (PST)
Date: Tue, 26 Nov 2019 12:23:37 -0700
From: Rob Herring <robh@kernel.org>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH v2] of: unittest: fix memory leak in
 attach_node_and_children
Message-ID: <20191126192337.GA13881@bogus>
References: <20191126014804.28267-1-erhard_f@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126014804.28267-1-erhard_f@mailbox.org>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>, frowand.list@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 Nov 2019 02:48:04 +0100, Erhard Furtner wrote:
> In attach_node_and_children memory is allocated for full_name via
> kasprintf. If the condition of the 1st if is not met the function
> returns early without freeing the memory. Add a kfree() to fix that.
> 
> This has been detected with kmemleak:
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205327
> 
> It looks like the leak was introduced by this commit:
> Fixes: 5babefb7f7ab ("of: unittest: allow base devicetree to have symbol metadata")
> 
> Signed-off-by: Erhard Furtner <erhard_f@mailbox.org>
> Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
> Changes in v2:
>   - Make the commit message more clearer.
> 
>  drivers/of/unittest.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Applied, thanks.

Rob
