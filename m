Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322F18EFD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:32:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4LW25qYzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:32:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DFsFJ7Ay; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m4Hk0bhkzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:30:09 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id z25so2685807pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=zgfcQ4zq56fUVnNobgw8fH89kr7q2PgqL6rtwXoTh/4=;
 b=DFsFJ7AyYB4fQmfKIl7wkYWS2bvU8ZzRldT+YF+vYdLD77y01D+DeGlJCwt1wkeIl9
 zK70Gy9FLhGD7HAFW6YwbQmH6WpIceMKZeRIxFbYZCdCwegeMvat1loX6IrlLzi3s9aA
 Y6f5me5BFtjw1jCwvNbohcKQJgwYutQExAISTgTgCe2X2tCQJ5U+Z4VmsoWxJuLI2/bj
 FZDlPu1As+tOoRsglttEI/YN5iDV45ZNDvdhDF9am0myIZpGUMRoxzcFmhpbFmN0vF5P
 gSO6PdwxKUqh/OhX0VL1imwyR8rMMuefCikX0Ory1ymy+PghbqhtbgbiSEuf+pJVOWAz
 /oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=zgfcQ4zq56fUVnNobgw8fH89kr7q2PgqL6rtwXoTh/4=;
 b=fnbS4Iu6sN5nvylwmBYCGN77W0gATrG95cPmP2rr1ck3HPIYBJqdn+EUeCkrJthEr/
 5GtUnnNLln6RnlVOyO9at1P5cwl4rqpBWM4nGZVYdMdnzpAkma4ZBcOKCrCzshqu5v5G
 Ne4z9g1zoVP2r/kyIPb8baavxvmokmRs3qClq2Akekio1RA4A/YSX2PHJ9LmZLQBYkYh
 jOpB6M00rfyqQULVOnGsrkui6Xdx1euCqg4+uQxeA2sPkbXtCitPbUNrye6z4kn6D+x0
 JheIji+CbSvvD0owyulCRlC/3hdE5kYTyuOOPjBSyby9icompOvL9PUhDV3r/AvgNch4
 mMEQ==
X-Gm-Message-State: ANhLgQ2MjA0/QHSz1BzQTyDkvm7o9//DpXOyP5vCvixRuOhfzGnE/S6m
 28+KiFVzBDrKZ2QodSRT8FpI8Vyz
X-Google-Smtp-Source: ADFU+vvhqt3OuiRbVx2NmmI4oP3POkvlqPrYZ76Y6yJbZLk/r71NYJftf37CKKEoEZ8iD4tsyuZp+w==
X-Received: by 2002:a63:ed10:: with SMTP id d16mr20360048pgi.107.1584945007857; 
 Sun, 22 Mar 2020 23:30:07 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id 15sm12001148pfp.125.2020.03.22.23.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:30:07 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:26:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/16] powerpc: Use a macro for creating instructions
 from u32s
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-5-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-5-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584944668.qhbtv64kb2.astroid@bobo.none>
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
> In preparation for instructions having a more complex data type start
> using a macro, PPC_INST(), for making an instruction out of a u32.
> Currently this does nothing, but it will allow for creating a data type
> that can represent prefixed instructions.

Where is the macro? And, can it be a static inline (and lowercase)=20
instead? No big deal if not.

Thanks,
Nick

=
