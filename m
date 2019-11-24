Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 310CB108162
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2019 02:50:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LCm95LwPzDqw3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2019 12:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LChy5yctzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 12:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="zWhzw7x5"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47LChy5RtLz8t3K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 12:47:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47LChy3xk6z9sR1; Sun, 24 Nov 2019 12:47:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="zWhzw7x5"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47LChy1cr3z9sQw
 for <linuxppc-dev@ozlabs.org>; Sun, 24 Nov 2019 12:47:30 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id b19so5521622pfd.3
 for <linuxppc-dev@ozlabs.org>; Sat, 23 Nov 2019 17:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=3lBSw1FKqUY2XmkojjgeEVuCah7EC3Ab3ESxu/cmir0=;
 b=zWhzw7x5/RJn0C/Oqe6rYfQv+Tq3nuVMPxltU/b4lTxiuPAV9+ArjrPyt0+grcoqfE
 FkISyU4V763zqS2vAgr+htQCrDwW36gISid2swMb3mC9i+AAxE+wo5sgFixtWemSBjMa
 uz3ZtWRrdr43UC/iYbQE2nD9G9qloomONbdtHiEt+lIhII4JiuU/KUnGwiTUA7AgHEu9
 sp/+0/Bj9UrvsRAlrExekywwbCydKN41DniRk7lO4jEtlJZMfFqpXuxmcqI64hTuUkVh
 CmzXdZigAJR5OnVh6LyUaCrSDxy8UscxNHlWB7lqwxrEGhnfqoUTF08CHge0Q+LNd1k8
 S5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=3lBSw1FKqUY2XmkojjgeEVuCah7EC3Ab3ESxu/cmir0=;
 b=ejY1TIvqsIFZBiynAUQNHf4VwbYsAuTmq4oXz0GeMEHGY2pFc3ChG6VigaYBMc7wn4
 hbF3K069UdumoQmf+Pbcen5MCFA8XDqCALQ8YKUhCB/60PhFDDtrXdW6aP/E9z6btoa9
 sOXGn4VYuiW6Dp1YN7l/sKHqasJbrE/lyfhZ04BuB2o95QHmm/OO2ABoPWNmLNtMzRr5
 NnHUBQg3ETQfAr3Ys3XLt4nTose0PtHJSb8j0dePb0wMRu90EoBVTQiVZUHwMtYu2qe/
 6W3Lm+yA4RB/KXoVlIju1H2APMpsl00uQ/Ng6YyUMC0NelNTruJ3hgmM+AgA3v3s3g6/
 E1pQ==
X-Gm-Message-State: APjAAAXA6Zvs6lMrCiO+3JdAgE+fGxUxDcvlWiXEM4JXL4wsuM5MFJ6Q
 Q3y3+gj5SuRmQSDKYg49Xhmzew==
X-Google-Smtp-Source: APXvYqyapDqAsl68Vz328TZMT25DsQ4nZ9A7WrUonPi+D/3NoDxQYj1dG4ceBc5wvJk9zMsuRtjKuQ==
X-Received: by 2002:a62:5485:: with SMTP id
 i127mr18879698pfb.186.1574560048001; 
 Sat, 23 Nov 2019 17:47:28 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id c84sm3042658pfc.112.2019.11.23.17.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 17:47:27 -0800 (PST)
Date: Sat, 23 Nov 2019 17:47:23 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net 4/4] ibmvnic: Serialize device queries
Message-ID: <20191123174723.2a5d603d@cakuba.netronome.com>
In-Reply-To: <1574451706-19058-5-git-send-email-tlfalcon@linux.ibm.com>
References: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
 <1574451706-19058-5-git-send-email-tlfalcon@linux.ibm.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: brking@linux.vnet.ibm.com, netdev@vger.kernel.org,
 julietk@linux.vnet.ibm.com, dnbanerg@us.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Nov 2019 13:41:46 -0600, Thomas Falcon wrote:
> @@ -5050,6 +5090,7 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
>  			  __ibmvnic_delayed_reset);
>  	INIT_LIST_HEAD(&adapter->rwi_list);
>  	spin_lock_init(&adapter->rwi_lock);
> +	mutex_init(&adapter->fw_lock);
>  	init_completion(&adapter->init_done);
>  	init_completion(&adapter->fw_done);
>  	init_completion(&adapter->reset_done);

Could you also add a mutex_destroy() call?
