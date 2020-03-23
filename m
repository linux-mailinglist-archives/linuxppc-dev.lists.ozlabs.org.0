Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779B18EFE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:44:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4ch3CsCzDqDG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:44:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sYxZTx26; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m4X36CnLzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:40:51 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t16so5506559plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=j8cfl7LuQJttugOopDjONj6lm6yEzBWahqsp0bOPOCU=;
 b=sYxZTx26KsleD6zL6OnU968Uid3SDmFu6Dwdz8fkeXN1DjPbnhJro0/sEmzfv3zNHj
 QzysXijEHCfhObL983p9Fg3O01cSlB0i4pD4e88jzow7gwLMMk29OVEoAZaA+aGEbq1I
 G32c/mN/ynVIK+v38e1tIS+xOnHac1jM6J7tQhyi5u9MoGdXqugVJux8B0l0MBLZB6B0
 RjJ+g8jNZkRSD/6ONaXqFeALxdT41zR1c+QVp8xPMzasNn9f2sY+dr+Y+m78l4fWhxVU
 jI0TrHTUsSau/tedpapQJ9UkhvKeiRHQdS5L5oapufF9DM8gf/hBVCfvWyo944FmFD+B
 DFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=j8cfl7LuQJttugOopDjONj6lm6yEzBWahqsp0bOPOCU=;
 b=UzpVCpr/yzAcJ2e7M83XpG5/Rb/fk/vWX8HrwHSNE+/xeI1cV51/+DtzYvFaRMfStL
 7zNqPL2eOvrkC6KulCo+ROPTETAmcW9RikPGZnjaJ+QCz2WWKlquuTi8uHpqZvYuro1v
 zjeTL/y/ukghlxMGcBEzQQExfFzdkW0XEgkQ+/e9aeuEFco6L3TPhGcgz9jf7fmkVSEu
 d3x9p/EDUXhC2IlBnjznjBvPZF05PCejnpHCUTaamdTsbCrFM8sP6MuA84TEBerJKSt8
 XRa6mfLWgy2vRFCTAXw2EuNYu5Eo+vAylD/+puu2dx694Y4NHxcEjHwbzqntZimZLFCr
 FePQ==
X-Gm-Message-State: ANhLgQ0AofMyDejjqoXvYN6AG95ebZWty2g/Zi91dCA4fdtOIAI2AvOU
 LGiiEO6nz1h0Kd7f0j35vpE=
X-Google-Smtp-Source: ADFU+vsDAZU9ABevs8OBg31+D7RgkHLfU6CvrBb5vWcs1RSSnlP7LeKQqIi8AfA4u1M53HzAVM/tRw==
X-Received: by 2002:a17:90a:350d:: with SMTP id
 q13mr22805859pjb.171.1584945649014; 
 Sun, 22 Mar 2020 23:40:49 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id j17sm12323665pfd.175.2020.03.22.23.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:40:48 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:37:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/16] powerpc: Use a function for masking instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-6-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-6-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584944803.77ebm362hp.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:17 pm:
> In preparation for using an instruction data type that can not be used
> directly with the '&' operator, use a function to mask instructions.

Hmm. ppc_inst_mask isn't such a good interface I think. It takes a
ppc_inst and a mask, you would expect it to return a ppc_inst, probably
with some part of its value anded with your mask value but not entirely
clear.

I would have a ppc_inst_val that is a more mechanical replacement and
lets you do more things with it, although I like the other helpers you
add later. Oh you've added ppc_inst_word further down. Why not use that
here intead of ppc_inst_mask()?

Thanks,
Nick

=
