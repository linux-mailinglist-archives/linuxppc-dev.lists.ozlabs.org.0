Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111660F14
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 07:21:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gg6v33Y1zDqgS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 15:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wpao8niE"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gg5K1hTRzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 15:20:02 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id t14so2414930plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 22:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=bFE47XNw2Gl9DS/M2rRtIWV/q37wjpho88mXjviiy8A=;
 b=Wpao8niEisECWInKj53YlrkhJcJKSk03lVamO/l+rlY0mNZATafEu+QqflNugvP/hU
 BV8ffw3OJ1xh7hgDh8eZocyaft6Tn8nqis1HURnCZvADtj2AqRDRkJApqMDqfTfqIrMl
 53JtBcMOXVI0Qto/ohW1rV4oBjqfcIEAHCWHaOEzspTIVIG8UD9WNbpPACPqkgYi9V3o
 9BXFAYStg4ZvkhW9y1X7PE6061hFPc5J/p2ibrRO9s3Stw9gy1f36yzM91O6E/H+4miB
 0nvbkH0IzHR6L1a56BUw3anjIppFATyA0Oq6hX/8eTcni+SoItxjLNst4bS/z2uCKJfS
 GDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=bFE47XNw2Gl9DS/M2rRtIWV/q37wjpho88mXjviiy8A=;
 b=lpUrPo5D0rDvrad0mDoOx4nR0qPSbcl+/B+7A/QacxiR79042Lkj6K9fTXmo06HgbA
 +KNfXOaOuCEDqhhEre28uhxs4Zmnci47Ix956HHWXtFy2Bf6NYUTocvmkuligAVgfMuz
 cG4EhYG3Arp1BvyUKqkX+INmJPS/DmRzaXIzxberI5cAc5KTuJXXpp6Vhg+z7ewMo6/N
 y9+cQrcWXLekTKBcFdbDyyIYAvDizzn/5iuVUXKqi1Fpmm4It2hosJW8shXbYTs+jqsi
 y1oppKpIPU1Ksa7vyi2G1Hi/3Vm0Itp2Off1QGEi/dOR+8GQZLMO9JrdXb69c5PY3Nqj
 G3Lw==
X-Gm-Message-State: APjAAAU9xYmUCK5JAbvnrcgQzdzVNn0YPN3ld6Fgx4NfEAMF+ebzhLEU
 Ts24nIHUXY+J1Pdb/LFtcuXxAAUD
X-Google-Smtp-Source: APXvYqyInsEaVMKCF8MFXPWFEuQRJoJLP8pQOjk97dEpMZkgPLymQBPNvh9N2G8PAWyBtAItgpIveQ==
X-Received: by 2002:a17:902:722:: with SMTP id
 31mr9487031pli.163.1562390399608; 
 Fri, 05 Jul 2019 22:19:59 -0700 (PDT)
Received: from localhost (203-213-47-159.tpgi.com.au. [203.213.47.159])
 by smtp.gmail.com with ESMTPSA id q1sm18361054pfn.178.2019.07.05.22.19.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 22:19:58 -0700 (PDT)
Date: Sat, 06 Jul 2019 15:18:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v3 1/7] powerpc/mce: Make machine_check_ue_event() static
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj
 <santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-2-santosh@fossix.org>
In-Reply-To: <20190705212647.21750-2-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562390260.x5ujybyvrp.astroid@bobo.none>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 6, 2019 7:26 am:
> From: Reza Arbab <arbab@linux.ibm.com>
>=20
> The function doesn't get used outside this file, so make it static.
>=20
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

=
