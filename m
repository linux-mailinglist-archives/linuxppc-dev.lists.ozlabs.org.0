Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 562DC108160
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2019 02:48:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LCk82625zDqwL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2019 12:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LChT5H7HzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 12:47:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="UBeOhOVQ"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47LChT2PTXz8t3K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 12:47:05 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47LChT21JBz9sQw; Sun, 24 Nov 2019 12:47:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="UBeOhOVQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47LChS2Gtlz9sPZ
 for <linuxppc-dev@ozlabs.org>; Sun, 24 Nov 2019 12:47:02 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id z188so5314960pgb.1
 for <linuxppc-dev@ozlabs.org>; Sat, 23 Nov 2019 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=yMmdkZWPRNJJFij2NhsWbh6pUoNvkfx10Q4+z88ErM0=;
 b=UBeOhOVQGRUkz7+Ha9DMWP6dQXEuwXHgZnurqd+/0MrwsSGQWsqAJ0Cd0VOEzd8VQE
 zRlywA6Fc+Q3pJDm2ui0qc11p4S+uqx9+rJ4ttJBEnJl1aEfktMil0M+Msyhe/fJ5S9i
 nyIlVLjvk040Tpv6Nla7pRFQkSjBKQG7fC59zfrY8X2LUrnQcrb0BNrvJ1uf/S2rCMEq
 9SQ3iDhpMSMrF1wRmcuY1LYwh5D+wNZ5y4gGD8VhReAlzriVkKxPH27IIzHRiQuZjWV5
 PeSz52jdtL2LzlW6UGKUmLovrSjSuLLQgpdBgyubpMyt5GAN+hIAcD2Pp3YFYK0C1lAL
 Z8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=yMmdkZWPRNJJFij2NhsWbh6pUoNvkfx10Q4+z88ErM0=;
 b=ULSDzNM1EAyP5VAGdkEqmKTV3kuG9ZwlW2Ihzqs+vltdjjAVHK7SLI8dIHpZRzn0QQ
 Gk5DDQSYcA9wmYiqdwoHTtW53tWRLbli2QX76AbmWdEb3xKX4L2XTEPZudQwO3SIrH8l
 CyYX0XFSGmV+JZ0pjOalVSNhQIz7PefM4uI/70iypKdYjmtZSgyA6bOLvX9DoFiWftJd
 29fdFB6fG9wjuB/Sdxw9GXCiKAMGW0d0YLHXxzwJgD1wGVoghCss9c16alcMJF7jCelx
 hd76DZatPd6mAdclisWe/3tHKCifFG0yUSKkZ4BJb6YLRXk6T/QTYLOiCg7uwVpKC24K
 GC+g==
X-Gm-Message-State: APjAAAVXQS0aDb67Bd9jFEfROvUtN4PehWITn+N7hRSK6NXcBpgXRov3
 q/0nM6qGnCB33Y1tJ8L80M8hAQ==
X-Google-Smtp-Source: APXvYqxnDB6Vj5Fe6vlAlXy44XNkKayLVR9vUlTsn1u0ajlJlGnUZHsww4zNV01AT214QrfKB50gEQ==
X-Received: by 2002:a63:df09:: with SMTP id u9mr24303463pgg.20.1574560018915; 
 Sat, 23 Nov 2019 17:46:58 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id i5sm2920463pfo.52.2019.11.23.17.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 17:46:58 -0800 (PST)
Date: Sat, 23 Nov 2019 17:46:53 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net 3/4] ibmvnic: Bound waits for device queries
Message-ID: <20191123174653.19e37c30@cakuba.netronome.com>
In-Reply-To: <1574451706-19058-4-git-send-email-tlfalcon@linux.ibm.com>
References: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
 <1574451706-19058-4-git-send-email-tlfalcon@linux.ibm.com>
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

On Fri, 22 Nov 2019 13:41:45 -0600, Thomas Falcon wrote:
> +static int ibmvnic_wait_for_completion(struct ibmvnic_adapter *adapter,
> +				       struct completion *comp_done,
> +				       unsigned long timeout)
> +{
> +	struct net_device *netdev = adapter->netdev;
> +	u8 retry = 5;
> +
> +restart_timer:
> +	if (!adapter->crq.active) {
> +		netdev_err(netdev, "Device down!\n");
> +		return -ENODEV;
> +	}
> +	/* periodically check that the device is up while waiting for
> +	 * a response
> +	 */
> +	if (!wait_for_completion_timeout(comp_done, timeout / retry)) {
> +		if (!adapter->crq.active) {
> +			netdev_err(netdev, "Device down!\n");
> +			return -ENODEV;
> +		} else {
> +			retry--;
> +			if (retry)
> +				goto restart_timer;
> +			netdev_err(netdev, "Operation timing out...\n");
> +			return -ETIMEDOUT;

Hm. This is not great. I don't see the need to open code a loop with
a goto:

while (true) {
	if (down())
		return E;

	if (retry--)
		break;

	if (wait())
		return 0
}

print(time out);
return E;

The wait_for_completion_timeout() will not be very precise, but I think
with 5 sleeps it shouldn't drift off too far from the desired 10sec.

> +		}
> +	}
> +
> +	return 0;
> +}
