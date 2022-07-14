Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC05753F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 19:22:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkLrx0TzBz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 03:22:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.51; helo=mail-io1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkLrP0zPTz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 03:21:40 +1000 (AEST)
Received: by mail-io1-f51.google.com with SMTP id u20so1958287iob.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 10:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TwlP1i3DseYJRbHuqOfV0GFqZdryH2G33X6Mm9Jm2CM=;
        b=yshbJULlbTkVEE4Nom95Ehg2ohDywAK8wT3o8008s9CGFj32njADMLvW0MxC0bvZra
         rYZ52xdcvEvsiGcGwew7nyZ5baNX/wiGegofPlWMfxwv0lkrEajSEkmOSexasrK6R+wB
         Z/AFqBk2ukjUgGjZHRnUyd1Y9s0DsYwoOpLQoVsQ8nOp2nqocP6WHK79gN6PULFo48+K
         JLrhZ+U25W7EH3ypnyqm4M2BzCieAVoFXRDuylnLpyeVwXKYZE8OjSCkS8sb0zFgGKAD
         qm5rtUTY0QR7dALIJuM0pDpQkmvjh5wOal+qluvPuGkA5p3++TixN8ehA9bz2ZFOKJ/Z
         4btg==
X-Gm-Message-State: AJIora/D8PS3Sll4PjVzv/UZ1B5VoL9D/m+WCdifYhTk5oyvYNTKuVUw
	ITQS5IijYOy7ZtwJevWWdQ==
X-Google-Smtp-Source: AGRyM1vO9dGrA7Y7SKsg+5554fBaotiNHywW1yLUMUZ53GyvbeVEnUtAvGac2Q1pjgYrrT0HbEWTiw==
X-Received: by 2002:a05:6602:1682:b0:65d:f539:e30 with SMTP id s2-20020a056602168200b0065df5390e30mr4768576iow.81.1657819297971;
        Thu, 14 Jul 2022 10:21:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p32-20020a056638192000b00339da678a7csm970726jal.78.2022.07.14.10.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 10:21:37 -0700 (PDT)
Received: (nullmailer pid 2584872 invoked by uid 1000);
	Thu, 14 Jul 2022 17:21:36 -0000
Date: Thu, 14 Jul 2022 11:21:36 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v6 5/6] of: kexec: Refactor IMA buffer related functions
 to make them reusable
Message-ID: <20220714172136.GA2575969-robh@kernel.org>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-6-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707172026.831614-6-stefanb@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 07, 2022 at 01:20:25PM -0400, Stefan Berger wrote:
> Refactor IMA buffer related functions to make them reusable for carrying
> TPM logs across kexec.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> 
> ---
> v6:
>  - Add __init to get_kexec_buffer as suggested by Jonathan
> 
> v5:
>  - Rebased on Jonathan McDowell's commit "b69a2afd5afc x86/kexec: Carry
>    forward IMA measurement log on kexec"
> v4:
>  - Move debug output into setup_buffer()
> ---
>  drivers/of/kexec.c | 126 ++++++++++++++++++++++++++-------------------
>  1 file changed, 74 insertions(+), 52 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
