Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73391DBC54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 07:03:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vYnh4GxjzDrLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 16:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FZ0tEDaK"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vYlj3G6XzDrL1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 16:01:13 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g9so934392plj.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wpJfPZmMYz1gHLTNi+cKJTn1LIoYcx1Zone10S78hMg=;
 b=FZ0tEDaKSb1fjZ35ji80nGBEkLxkXPIXJ2FvWbrkcMTHJwnnbaOejUCN23Q2cfSp7G
 a7iRe4brGFHMvYqxelgkcTNRPK22hSf8NEaUxvPvNabN9WcB7jUijIgIlDZ2JHj0Roiu
 p4+P+kEoqzv/73jmaP3gRXUkHTOXN5rXd/uiS8b+WphgcEU4zkHXzjtZOvDwIR+7W41V
 WJxIBek3fEIO+i+u7AAhsDfy5UOXgdrJxiuVJ6gzALiWuHWdIK3zkT/slxgCkweStRkr
 gbOrWYsJ4MojCeGdlm51kVCrSD0cEqz1g70jncmaD2Xn0KWjig8Yto64REnBiVZqrJ19
 CRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wpJfPZmMYz1gHLTNi+cKJTn1LIoYcx1Zone10S78hMg=;
 b=K0q3AzJmTyeFMGSNJ9sY0XSAREKXnq9dU3mBiSZ4iyxq5GuM8zzXY3WgfhNepWLveN
 vibvesbTmwIrqhkCaa6usPusmvH0tj2BZX536Rw3LOTgwW9tOWrE/Foi/M6D4/K8VBjp
 yz3wgkruQMtZfREXytSHVIJpWQfzyt/R+Pv0nJWRYloesTlWOvqGfpO9NNYuwomJiYgR
 lP/JfIdeZ+bNFGI+ys/okFWcTUiSsa+Y029ZCZnrzvBc93xfnTTdQqtZ7gOvTSTnoHp+
 wp9AMQc08fLsDmEhgs1yjZzDcepMCZFbXptvb2Z7CYabfefMBDV75sSDpKR3yPab5lSS
 7k/A==
X-Gm-Message-State: APjAAAW/xSLUBuTBdDXLbkYivnQX2JQC2NPcBeRTnIbd+40uUbdN//Xr
 Ka8NXfHdOsdlKuGvyiipBwI=
X-Google-Smtp-Source: APXvYqyyRC3rRWHEdU/4ehIqVTyMDDP6d3MBshcdRrCKVsJhdcNuojXErnWWf00fZs7sEBIVI05X/w==
X-Received: by 2002:a17:902:b94b:: with SMTP id
 h11mr7840953pls.21.1571374871038; 
 Thu, 17 Oct 2019 22:01:11 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::cfd0])
 by smtp.gmail.com with ESMTPSA id s141sm5721197pfs.13.2019.10.17.22.01.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 22:01:10 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:01:08 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the bpf-next tree
Message-ID: <20191018050107.dsnt4ukq6n6l6luy@ast-mbp>
References: <20191018105657.4584ec67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018105657.4584ec67@canb.auug.org.au>
User-Agent: NeoMutt/20180223
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Networking <netdev@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 18, 2019 at 10:56:57AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> WARNING: 2 bad relocations
> c000000001998a48 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
> c000000001998a50 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end

Can ppc folks help me figure out what this warning means?

