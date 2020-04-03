Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3F19CFEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 07:48:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tpqy3S9dzDr0x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:47:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h/Qn64Su; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tpnY43DYzDrfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 16:45:53 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id w9so2535640pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 22:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=mLUndy33Q+5nxA25yn/m7xkt0bY7jMshYIpgQ1IoEiI=;
 b=h/Qn64SuxRNUQHuxXTp3aydzR/bT6Y0kEbLeU7+kwlKKCmm0rHuADet+ea4g3+QS45
 OStqjvs4+7jFuKqeVWfypj+Xro15Jm+t8MG+47mCDz3jmAZ8hnTOQjibSZbS+aSCzqab
 Q+I7a4tcIuJRAHIJrwvTWncy6zDTJWyeIOg1Nd3IQr9g7jkAD2yUVwZQYKQCloPNtelI
 YRYPvsQIskEpo1XbwRx1DcKWEyMkJMPiYKx8crvfOO0bI7fRCyxvhuyh7FTlk/4h8K3d
 R401c6XgQIUBxLj6gu3ZDuEgEGXza9zp09Mm/pLzjhX6D+NNGZwQ+k2yZ7o6EFwbTSoM
 SpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mLUndy33Q+5nxA25yn/m7xkt0bY7jMshYIpgQ1IoEiI=;
 b=Vc7sUEzDk8fJyQy8A7HTR6j7jCQGxfD16gIE6wFrcAqpGU/aewVynEjIIP0clyFlGO
 fqBU9g9I7DjlF8WkTsf6iJlvw5rEx/qEhC8NDs8e9+cA8aAGe4bJjMjFjd4S5Rkay/Q8
 5Zj4pDMcc3JNghSajf3abXYrH/odcxxWVan6gEHBr6sOnvfklcvjz8zhPifV09CwUY2j
 3eucvZC0dMSomTS0AAonBBbhIhh4pMGPxQsbpXSk0zfuJYtyXi0CqOe/x5nz41jaWiIL
 Ml54RIJDxPuebdWUIzTxfmWWhPYf/HDp/xZme2ucnyU5MyIWVcvppIFJK6p0j7EoxrqT
 XebA==
X-Gm-Message-State: AGi0Pua8NN7b/tahzSrPAgJiSxxQ1vom/GEj8tF7LCXJbdDAyG5jwiuW
 HF4nMX6SQclSZk+KQ8mpl9s=
X-Google-Smtp-Source: APiQypIgIkQe18pnJ3VBV6BBrgNtAMuR4OPxixfk332WvM50bdUmpFSyMF3wpA1T0Mko2UXoxrR8GQ==
X-Received: by 2002:a17:90a:1b22:: with SMTP id
 q31mr7966014pjq.109.1585892751213; 
 Thu, 02 Apr 2020 22:45:51 -0700 (PDT)
Received: from 192-168-1-12.tpgi.com.au (220-245-129-32.tpgi.com.au.
 [220.245.129.32])
 by smtp.googlemail.com with ESMTPSA id v185sm4939683pfv.32.2020.04.02.22.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 22:45:50 -0700 (PDT)
Message-ID: <8a83b90a0cf0889e1c58c33cd2946916a85c5752.camel@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/eeh: Clean up edev cleanup for VFs
From: Oliver O'Halloran <oohall@gmail.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Apr 2020 16:45:47 +1100
In-Reply-To: <d58f9ba966e402eca73bf437ee39e28007bf7d21.1585544197.git.sbobroff@linux.ibm.com>
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <d58f9ba966e402eca73bf437ee39e28007bf7d21.1585544197.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> Because the bus notifier calls eeh_rmv_from_parent_pe() (via
> eeh_remove_device()) when a VF is removed, the call in
> remove_sriov_vf_pdns() is redundant.

eeh_rmv_from_parent_pe() won't actually remove the device if the
recovering flag is set on the PE. Are you sure we're not introducing a
race here?

