Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02733483370
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jan 2022 15:37:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSJHK63Nlz307W
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 01:37:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ahogkqy6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ahogkqy6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ahogkqy6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ahogkqy6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSJGW4dryz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jan 2022 01:36:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641220589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6S1XPJQfGremvTb3LBNGu2BEruAkVvXKB9QFLHNFjlY=;
 b=Ahogkqy6HT+sa8OZYT9ThJJ5vMk4cepaKyRG1F4Xdo4bpQGxGDVCjhNpa5KExXldABzYcZ
 6De4vYemsDnWUJksUMlkjFwhO7Uq64Smt1s+c4oiZx7gM7g87P5nuJ/9P1Db8vCIYWMHlv
 6ZcDivV4EsE1pLezoiwErZWQdqyqjhI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641220589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6S1XPJQfGremvTb3LBNGu2BEruAkVvXKB9QFLHNFjlY=;
 b=Ahogkqy6HT+sa8OZYT9ThJJ5vMk4cepaKyRG1F4Xdo4bpQGxGDVCjhNpa5KExXldABzYcZ
 6De4vYemsDnWUJksUMlkjFwhO7Uq64Smt1s+c4oiZx7gM7g87P5nuJ/9P1Db8vCIYWMHlv
 6ZcDivV4EsE1pLezoiwErZWQdqyqjhI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-lG6PbwnBOsGaaQWT0QXy4w-1; Mon, 03 Jan 2022 09:36:25 -0500
X-MC-Unique: lG6PbwnBOsGaaQWT0QXy4w-1
Received: by mail-ed1-f69.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso15775441edd.16
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jan 2022 06:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6S1XPJQfGremvTb3LBNGu2BEruAkVvXKB9QFLHNFjlY=;
 b=MN9MfBQP7nbjXL8ya8guooLoWItAVA4qfh1lkCa7NlJAry5/CGvR2B3lnCwiM/jW0U
 y1fa92aI0NpNZI8mecI3Wp1gnTPLTVd1H3O0NLDXpRfks6tzqcp3/XP/ACLhvMSn1miC
 02PDjfju0nQ6OKDB4HsAMVJLsdTy915gbE8VvTYCNOBaYKJ6u6ONQ2f+jwthZVAPaM0W
 1ed1LoWqTjT6sRhtK9NJQaVANcz/0j0J/clQqOFcyWvXasVf8caEUf4pFoYs93hbX+HM
 R9zHfzZODQf5VPGVVGrcDivP4Y3+R12kjwkHUWisLdl3toXssb7cRWR/+9rxlUKeqfyX
 BBmQ==
X-Gm-Message-State: AOAM531aTnA3/JnV9zRv5XxAKcYUSf01hpy3rbgwVELzSe4WAs4dsUH2
 bDOLYvSPrQUQAItngyygiYnKoeOROl//K1NL156PK3oRkdqxLID1pUoSah4eM/qmtPpCMDhkbxG
 Jg1hchpLj5aDNp8fXPNsvH8IdzA==
X-Received: by 2002:a17:907:33d0:: with SMTP id
 zk16mr35770363ejb.165.1641220584746; 
 Mon, 03 Jan 2022 06:36:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/2vxpr9zrRB2To0dotN1c4A64scychvym1I8BTv193we4aIN9+pu1XK7snkA6wTtoCKxiIg==
X-Received: by 2002:a17:907:33d0:: with SMTP id
 zk16mr35770350ejb.165.1641220584523; 
 Mon, 03 Jan 2022 06:36:24 -0800 (PST)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id 19sm7714227ejv.207.2022.01.03.06.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 06:36:24 -0800 (PST)
Date: Mon, 3 Jan 2022 15:36:21 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [BUG] powerpc: test_progs -t for_each faults kernel
Message-ID: <YdMJ5fuRr+rKiNCe@krava>
References: <YdIiK8/krc5x5BmM@krava>
 <1641188093.6jujx0dvg7.naveen@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1641188093.6jujx0dvg7.naveen@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: haliu@redhat.com, Daniel Borkmann <daniel@iogearbox.net>,
 linuxppc-dev@lists.ozlabs.org, Alexei Starovoitov <ast@kernel.org>,
 Yauheni Kaliuta <ykaliuta@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
 Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 03, 2022 at 11:07:02AM +0530, Naveen N. Rao wrote:
> Hi Jiri,
> 
> Jiri Olsa wrote:
> > hi,
> > when running 'test_progs -t for_each' on powerpc we are getting
> > the fault below
> 
> This looks to be the same issue reported by Yauheni:
> http://lkml.kernel.org/r/xunylf0o872l.fsf@redhat.com
> 
> Can you please check if the patch I posted there fixes it for you?

great, yes, that fixes it for me

thanks,
jirka

